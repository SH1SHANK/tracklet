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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<CategoriesStruct>> getCategories() async {
  try {
    final response = await Supabase.instance.client
        .from('categories')
        .select('id, name, icon')
        .eq('is_active', true)
        .order('id');

    final List<dynamic> data = response as List<dynamic>;

    return data.map((category) {
      final String displayLabel = '${category['icon']} ${category['name']}';

      return CategoriesStruct(
        categoryId: category['id'] as int,
        categoryName: displayLabel,
      );
    }).toList();
  } catch (e) {
    print('Error fetching categories: $e');
    return <CategoriesStruct>[];
  }
}
