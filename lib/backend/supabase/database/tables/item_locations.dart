import '../database.dart';

class ItemLocationsTable extends SupabaseTable<ItemLocationsRow> {
  @override
  String get tableName => 'item_locations';

  @override
  ItemLocationsRow createRow(Map<String, dynamic> data) =>
      ItemLocationsRow(data);
}

class ItemLocationsRow extends SupabaseDataRow {
  ItemLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ItemLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get itemId => getField<String>('item_id')!;
  set itemId(String value) => setField<String>('item_id', value);

  String get kind => getField<String>('kind')!;
  set kind(String value) => setField<String>('kind', value);

  String? get label => getField<String>('label');
  set label(String? value) => setField<String>('label', value);

  double get lat => getField<double>('lat')!;
  set lat(double value) => setField<double>('lat', value);

  double get lng => getField<double>('lng')!;
  set lng(double value) => setField<double>('lng', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
