import '/components/user_found_item_widget.dart';
import '/components/user_lost_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_items_widget.dart' show MyItemsWidget;
import 'package:flutter/material.dart';

class MyItemsModel extends FlutterFlowModel<MyItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for userLostItem dynamic component.
  late FlutterFlowDynamicModels<UserLostItemModel> userLostItemModels;
  // Models for userFoundItem dynamic component.
  late FlutterFlowDynamicModels<UserFoundItemModel> userFoundItemModels;

  @override
  void initState(BuildContext context) {
    userLostItemModels = FlutterFlowDynamicModels(() => UserLostItemModel());
    userFoundItemModels = FlutterFlowDynamicModels(() => UserFoundItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userLostItemModels.dispose();
    userFoundItemModels.dispose();
  }
}
