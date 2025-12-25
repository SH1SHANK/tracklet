import '../database.dart';

class FlagsTable extends SupabaseTable<FlagsRow> {
  @override
  String get tableName => 'flags';

  @override
  FlagsRow createRow(Map<String, dynamic> data) => FlagsRow(data);
}

class FlagsRow extends SupabaseDataRow {
  FlagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FlagsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get itemId => getField<String>('item_id')!;
  set itemId(String value) => setField<String>('item_id', value);

  String? get reporterUserId => getField<String>('reporter_user_id');
  set reporterUserId(String? value) =>
      setField<String>('reporter_user_id', value);

  String get reason => getField<String>('reason')!;
  set reason(String value) => setField<String>('reason', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
