// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GooglePlaceStruct extends FFFirebaseStruct {
  GooglePlaceStruct({
    String? name,
    String? address,
    double? lat,
    double? lng,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _address = address,
        _lat = lat,
        _lng = lng,
        _city = city,
        _state = state,
        _country = country,
        _zipCode = zipCode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  static GooglePlaceStruct fromMap(Map<String, dynamic> data) =>
      GooglePlaceStruct(
        name: data['name'] as String?,
        address: data['address'] as String?,
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        zipCode: data['zip_code'] as String?,
      );

  static GooglePlaceStruct? maybeFromMap(dynamic data) => data is Map
      ? GooglePlaceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'address': _address,
        'lat': _lat,
        'lng': _lng,
        'city': _city,
        'state': _state,
        'country': _country,
        'zip_code': _zipCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'zip_code': serializeParam(
          _zipCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static GooglePlaceStruct fromSerializableMap(Map<String, dynamic> data) =>
      GooglePlaceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zip_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GooglePlaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GooglePlaceStruct &&
        name == other.name &&
        address == other.address &&
        lat == other.lat &&
        lng == other.lng &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        zipCode == other.zipCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, address, lat, lng, city, state, country, zipCode]);
}

GooglePlaceStruct createGooglePlaceStruct({
  String? name,
  String? address,
  double? lat,
  double? lng,
  String? city,
  String? state,
  String? country,
  String? zipCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GooglePlaceStruct(
      name: name,
      address: address,
      lat: lat,
      lng: lng,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GooglePlaceStruct? updateGooglePlaceStruct(
  GooglePlaceStruct? googlePlace, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    googlePlace
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGooglePlaceStructData(
  Map<String, dynamic> firestoreData,
  GooglePlaceStruct? googlePlace,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (googlePlace == null) {
    return;
  }
  if (googlePlace.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && googlePlace.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final googlePlaceData =
      getGooglePlaceFirestoreData(googlePlace, forFieldValue);
  final nestedData =
      googlePlaceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = googlePlace.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGooglePlaceFirestoreData(
  GooglePlaceStruct? googlePlace, [
  bool forFieldValue = false,
]) {
  if (googlePlace == null) {
    return {};
  }
  final firestoreData = mapToFirestore(googlePlace.toMap());

  // Add any Firestore field values
  googlePlace.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGooglePlaceListFirestoreData(
  List<GooglePlaceStruct>? googlePlaces,
) =>
    googlePlaces?.map((e) => getGooglePlaceFirestoreData(e, true)).toList() ??
    [];
