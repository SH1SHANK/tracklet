import '../database.dart';

class FeedFoundItemsTable extends SupabaseTable<FeedFoundItemsRow> {
  @override
  String get tableName => 'feed_found_items';

  @override
  FeedFoundItemsRow createRow(Map<String, dynamic> data) =>
      FeedFoundItemsRow(data);
}

class FeedFoundItemsRow extends SupabaseDataRow {
  FeedFoundItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedFoundItemsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get intent => getField<String>('intent');
  set intent(String? value) => setField<String>('intent', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  dynamic get location => getField<dynamic>('location');
  set location(dynamic value) => setField<dynamic>('location', value);

  DateTime? get eventDate => getField<DateTime>('event_date');
  set eventDate(DateTime? value) => setField<DateTime>('event_date', value);

  List<String> get imageUrls => getListField<String>('image_urls');
  set imageUrls(List<String>? value) =>
      setListField<String>('image_urls', value);

  int? get viewsCount => getField<int>('views_count');
  set viewsCount(int? value) => setField<int>('views_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get categoryIcon => getField<String>('category_icon');
  set categoryIcon(String? value) => setField<String>('category_icon', value);

  int? get pendingClaims => getField<int>('pending_claims');
  set pendingClaims(int? value) => setField<int>('pending_claims', value);
}
