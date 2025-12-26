import '../database.dart';

class ClaimsTable extends SupabaseTable<ClaimsRow> {
  @override
  String get tableName => 'claims';

  @override
  ClaimsRow createRow(Map<String, dynamic> data) => ClaimsRow(data);
}

class ClaimsRow extends SupabaseDataRow {
  ClaimsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClaimsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get itemId => getField<String>('item_id')!;
  set itemId(String value) => setField<String>('item_id', value);

  String get claimerUserId => getField<String>('claimer_user_id')!;
  set claimerUserId(String value) => setField<String>('claimer_user_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  List<String> get proofImages => getListField<String>('proof_images');
  set proofImages(List<String>? value) =>
      setListField<String>('proof_images', value);

  dynamic get contactInfo => getField<dynamic>('contact_info')!;
  set contactInfo(dynamic value) => setField<dynamic>('contact_info', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get responseMessage => getField<String>('response_message');
  set responseMessage(String? value) =>
      setField<String>('response_message', value);

  DateTime? get respondedAt => getField<DateTime>('responded_at');
  set respondedAt(DateTime? value) => setField<DateTime>('responded_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get claimerUsername => getField<String>('claimer_username');
  set claimerUsername(String? value) =>
      setField<String>('claimer_username', value);

  String? get itemName => getField<String>('item_name');
  set itemName(String? value) => setField<String>('item_name', value);
}
