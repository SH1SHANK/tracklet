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

Future<bool> acceptClaim(
  String claimUuid,
  String userId,
  String? responseText,
) async {
  try {
    final client = Supabase.instance.client;

    final response = await client.rpc(
      'accept_claim',
      params: {
        'claim_uuid': claimUuid,
        'firebase_uid': userId,
        'response_text': responseText,
      },
    );

    return response['success'] == true;
  } catch (e) {
    print('Error accepting claim: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
