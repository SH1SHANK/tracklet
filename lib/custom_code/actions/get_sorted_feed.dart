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

Future<List<FeedItemsRow>> getSortedFeed(String? sortBy) async {
  try {
    final client = Supabase.instance.client;

    String orderColumn = 'created_at';
    bool ascending = false;

    switch (sortBy) {
      case 'Oldest First':
        orderColumn = 'created_at';
        ascending = true;
        break;
      case 'Recently Updated':
        orderColumn = 'updated_at';
        ascending = false;
        break;
      case 'Most Viewed':
        orderColumn = 'views_count';
        ascending = false;
        break;
      case 'Least Viewed':
        orderColumn = 'views_count';
        ascending = true;
        break;
      case 'Newest First':
      default:
        orderColumn = 'created_at';
        ascending = false;
    }

    final response = await client
        .from('feed_items')
        .select()
        .order(orderColumn, ascending: ascending);

    final List<dynamic> data = response as List<dynamic>;

    return data
        .map((row) => FeedItemsRow(row as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Error fetching sorted feed: $e');
    return <FeedItemsRow>[];
  }
}
