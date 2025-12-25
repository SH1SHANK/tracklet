import '../database.dart';

class UserItemsSummaryTable extends SupabaseTable<UserItemsSummaryRow> {
  @override
  String get tableName => 'user_items_summary';

  @override
  UserItemsSummaryRow createRow(Map<String, dynamic> data) =>
      UserItemsSummaryRow(data);
}

class UserItemsSummaryRow extends SupabaseDataRow {
  UserItemsSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserItemsSummaryTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get lostItemsCount => getField<int>('lost_items_count');
  set lostItemsCount(int? value) => setField<int>('lost_items_count', value);

  int? get foundItemsCount => getField<int>('found_items_count');
  set foundItemsCount(int? value) => setField<int>('found_items_count', value);

  int? get activeCount => getField<int>('active_count');
  set activeCount(int? value) => setField<int>('active_count', value);

  int? get resolvedCount => getField<int>('resolved_count');
  set resolvedCount(int? value) => setField<int>('resolved_count', value);
}
