// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Convert The LatLng to GooglePlace And If LatLng is Null Return User's Current Location
// If Location Access is Denied Or LatLng is Null Then Use NIT Calicut As Address
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<FFPlace> convertLatLngToGooglePlace(LatLng? givenLatLng) async {
  LatLng targetLatLng;

  if (givenLatLng == null) {
    // Try to get user's current location
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled - using NIT Calicut as fallback');
        return _getNITCalicutLocation();
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions denied - using NIT Calicut as fallback');
          return _getNITCalicutLocation();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions permanently denied - using NIT Calicut as fallback');
        return _getNITCalicutLocation();
      }

      // Get current position with timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          print('Location request timed out - using NIT Calicut as fallback');
          throw Exception('Timeout');
        },
      );

      targetLatLng = LatLng(position.latitude, position.longitude);
    } catch (e) {
      // Any error getting location - use NIT Calicut as fallback
      print('Error getting location: $e - using NIT Calicut as fallback');
      return _getNITCalicutLocation();
    }
  } else {
    targetLatLng = givenLatLng;
  }

  // Try to geocode the coordinates
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      targetLatLng.latitude,
      targetLatLng.longitude,
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () => <Placemark>[],
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;

      return FFPlace(
        latLng: targetLatLng,
        name: placemark.name ?? '',
        address:
            '${placemark.street ?? ''}, ${placemark.locality ?? ''}, ${placemark.administrativeArea ?? ''}, ${placemark.country ?? ''}',
        city: placemark.locality ?? '',
        state: placemark.administrativeArea ?? '',
        country: placemark.country ?? '',
        zipCode: placemark.postalCode ?? '',
      );
    } else {
      // Return basic FFPlace with coordinates if no placemark found
      return FFPlace(
        latLng: targetLatLng,
        name: 'Unknown Location',
        address: '${targetLatLng.latitude}, ${targetLatLng.longitude}',
        city: '',
        state: '',
        country: '',
        zipCode: '',
      );
    }
  } catch (e) {
    // Return basic FFPlace with coordinates if geocoding fails
    print('Geocoding failed: $e');
    return FFPlace(
      latLng: targetLatLng,
      name: 'Location',
      address: '${targetLatLng.latitude}, ${targetLatLng.longitude}',
      city: '',
      state: '',
      country: '',
      zipCode: '',
    );
  }
}

// Helper function to return NIT Calicut location as fallback
FFPlace _getNITCalicutLocation() {
  // NIT Calicut coordinates: 11.2588° N, 75.7764° E
  return FFPlace(
    latLng: LatLng(11.2588, 75.7764),
    name: 'NIT Calicut',
    address: 'National Institute of Technology Calicut, Calicut, Kerala, India',
    city: 'Calicut',
    state: 'Kerala',
    country: 'India',
    zipCode: '673601',
  );
}
