import '../database.dart';

class ClaimMessagesTable extends SupabaseTable<ClaimMessagesRow> {
  @override
  String get tableName => 'claim_messages';

  @override
  ClaimMessagesRow createRow(Map<String, dynamic> data) =>
      ClaimMessagesRow(data);
}

class ClaimMessagesRow extends SupabaseDataRow {
  ClaimMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClaimMessagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get claimId => getField<String>('claim_id')!;
  set claimId(String value) => setField<String>('claim_id', value);

  String get senderUsername => getField<String>('sender_username')!;
  set senderUsername(String value) =>
      setField<String>('sender_username', value);

  String get senderRole => getField<String>('sender_role')!;
  set senderRole(String value) => setField<String>('sender_role', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<String> get proofImages => getListField<String>('proof_images');
  set proofImages(List<String>? value) =>
      setListField<String>('proof_images', value);
}
