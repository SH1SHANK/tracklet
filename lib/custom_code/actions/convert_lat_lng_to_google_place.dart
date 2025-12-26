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
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<FFPlace> convertLatLngToGooglePlace(LatLng? givenLatLng) async {
  LatLng targetLatLng;

  if (givenLatLng == null) {
    // Get user's current location
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    targetLatLng = LatLng(position.latitude, position.longitude);
  } else {
    targetLatLng = givenLatLng;
  }

  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        targetLatLng.latitude, targetLatLng.longitude);

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
