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

Future<List<FeedItemsRow>> renderFeed(
  String? searchQuery,
  String? sortByLabel,
  String? activeFilter,
  int? categoryId,
) async {
  try {
    final client = Supabase.instance.client;

    // Map UI sort labels to RPC values
    String sortBy = 'created';
    bool sortDesc = true;

    switch (sortByLabel) {
      case 'Oldest First':
        sortBy = 'created';
        sortDesc = false;
        break;
      case 'Recently Updated':
        sortBy = 'updated';
        sortDesc = true;
        break;
      case 'Most Viewed':
        sortBy = 'views';
        sortDesc = true;
        break;
      case 'Least Viewed':
        sortBy = 'views';
        sortDesc = false;
        break;
      case 'Newest First':
      default:
        sortBy = 'created';
        sortDesc = true;
    }

    final response = await client.rpc(
      'generatefeed',
      params: {
        'search_query': searchQuery,
        'filter_intent': activeFilter == 'none' ? null : activeFilter,
        'filter_category_id':
            (categoryId == null || categoryId == 0) ? null : categoryId,
        'sort_by': sortBy,
        'sort_desc': sortDesc,
        'limit_count': 50,
        'offset_count': 0,
      },
    );

    final List<dynamic> data = response as List<dynamic>;

    return data
        .map((row) => FeedItemsRow(row as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('Error fetching feed via RPC: $e');
    return <FeedItemsRow>[];
  }
}
