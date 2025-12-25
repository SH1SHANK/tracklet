import '../database.dart';

class OnesignalDevicesTable extends SupabaseTable<OnesignalDevicesRow> {
  @override
  String get tableName => 'onesignal_devices';

  @override
  OnesignalDevicesRow createRow(Map<String, dynamic> data) =>
      OnesignalDevicesRow(data);
}

class OnesignalDevicesRow extends SupabaseDataRow {
  OnesignalDevicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OnesignalDevicesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get playerId => getField<String>('player_id')!;
  set playerId(String value) => setField<String>('player_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
