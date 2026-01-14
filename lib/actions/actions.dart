import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future triggerUserNotification(
  BuildContext context, {
  String? recipientUserID,
  String? itemID,
  String? itemName,
  DateTime? itemCreatedAt,
  String? itemImageUrl,
  String? notificationTitle,
  String? notificationDescription,
}) async {
  UsersRecord? userDoc;

  userDoc = await queryUsersRecordOnce(
    queryBuilder: (usersRecord) => usersRecord.where(
      'uid',
      isEqualTo: recipientUserID,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  triggerPushNotification(
    notificationTitle: notificationTitle!,
    notificationText: notificationDescription!,
    notificationImageUrl: itemImageUrl,
    userRefs: [userDoc!.reference],
    initialPageName: 'manageClaims',
    parameterData: {
      'itemId': itemID,
      'itemName': itemName,
      'itemCreatedAt': itemCreatedAt,
      'itemImageUrl': itemImageUrl,
    },
  );
}
