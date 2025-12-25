// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserContactInfoStruct extends FFFirebaseStruct {
  UserContactInfoStruct({
    String? name,
    String? email,
    String? phone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _email = email,
        _phone = phone,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  static UserContactInfoStruct fromMap(Map<String, dynamic> data) =>
      UserContactInfoStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
      );

  static UserContactInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? UserContactInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'phone': _phone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserContactInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserContactInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserContactInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserContactInfoStruct &&
        name == other.name &&
        email == other.email &&
        phone == other.phone;
  }

  @override
  int get hashCode => const ListEquality().hash([name, email, phone]);
}

UserContactInfoStruct createUserContactInfoStruct({
  String? name,
  String? email,
  String? phone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserContactInfoStruct(
      name: name,
      email: email,
      phone: phone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserContactInfoStruct? updateUserContactInfoStruct(
  UserContactInfoStruct? userContactInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userContactInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserContactInfoStructData(
  Map<String, dynamic> firestoreData,
  UserContactInfoStruct? userContactInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userContactInfo == null) {
    return;
  }
  if (userContactInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userContactInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userContactInfoData =
      getUserContactInfoFirestoreData(userContactInfo, forFieldValue);
  final nestedData =
      userContactInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userContactInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserContactInfoFirestoreData(
  UserContactInfoStruct? userContactInfo, [
  bool forFieldValue = false,
]) {
  if (userContactInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userContactInfo.toMap());

  // Add any Firestore field values
  userContactInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserContactInfoListFirestoreData(
  List<UserContactInfoStruct>? userContactInfos,
) =>
    userContactInfos
        ?.map((e) => getUserContactInfoFirestoreData(e, true))
        .toList() ??
    [];
