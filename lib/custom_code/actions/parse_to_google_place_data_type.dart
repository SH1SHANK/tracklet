// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Convert The Given GooglePlace DataType to Custom GooglePlace DataType And If Input Parameter is Null Take User's Current Location LatLng and Convert it into The GooglePlace Custom DataType as a FallBack
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<GooglePlaceStruct> parseToGooglePlaceDataType(
    FFPlace? givenGooglePlace) async {
  if (givenGooglePlace != null) {
    // Convert FFPlace to GooglePlaceStruct
    return GooglePlaceStruct(
      name: givenGooglePlace.name ?? '',
      address: givenGooglePlace.address ?? '',
      city: givenGooglePlace.city ?? '',
      state: givenGooglePlace.state ?? '',
      country: givenGooglePlace.country ?? '',
      zipCode: givenGooglePlace.zipCode ?? '',
      latLng: givenGooglePlace.latLng ?? LatLng(0.0, 0.0),
    );
  } else {
    // Fallback: Get user's current location
    try {
      // Check location permissions
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

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Convert coordinates to address using reverse geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark placemark =
          placemarks.isNotEmpty ? placemarks.first : Placemark();

      // Create GooglePlaceStruct from current location
      return GooglePlaceStruct(
        name: placemark.name ?? 'Current Location',
        address: '${placemark.street ?? ''} ${placemark.subThoroughfare ?? ''}'
            .trim(),
        city: placemark.locality ?? '',
        state: placemark.administrativeArea ?? '',
        country: placemark.country ?? '',
        zipCode: placemark.postalCode ?? '',
        latLng: LatLng(position.latitude, position.longitude),
      );
    } catch (e) {
      // Return default GooglePlaceStruct if location services fail
      return GooglePlaceStruct(
        name: 'Unknown Location',
        address: '',
        city: '',
        state: '',
        country: '',
        zipCode: '',
        latLng: LatLng(0.0, 0.0),
      );
    }
  }
}
