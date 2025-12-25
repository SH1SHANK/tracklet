import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/lost_item_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  List<FeedItemsRow> feedItems = [];
  void addToFeedItems(FeedItemsRow item) => feedItems.add(item);
  void removeFromFeedItems(FeedItemsRow item) => feedItems.remove(item);
  void removeAtIndexFromFeedItems(int index) => feedItems.removeAt(index);
  void insertAtIndexInFeedItems(int index, FeedItemsRow item) =>
      feedItems.insert(index, item);
  void updateFeedItemsAtIndex(int index, Function(FeedItemsRow) updateFn) =>
      feedItems[index] = updateFn(feedItems[index]);

  List<FeedFoundItemsRow> feedFoundItems = [];
  void addToFeedFoundItems(FeedFoundItemsRow item) => feedFoundItems.add(item);
  void removeFromFeedFoundItems(FeedFoundItemsRow item) =>
      feedFoundItems.remove(item);
  void removeAtIndexFromFeedFoundItems(int index) =>
      feedFoundItems.removeAt(index);
  void insertAtIndexInFeedFoundItems(int index, FeedFoundItemsRow item) =>
      feedFoundItems.insert(index, item);
  void updateFeedFoundItemsAtIndex(
          int index, Function(FeedFoundItemsRow) updateFn) =>
      feedFoundItems[index] = updateFn(feedFoundItems[index]);

  List<FeedLostItemsRow> feedLostItems = [];
  void addToFeedLostItems(FeedLostItemsRow item) => feedLostItems.add(item);
  void removeFromFeedLostItems(FeedLostItemsRow item) =>
      feedLostItems.remove(item);
  void removeAtIndexFromFeedLostItems(int index) =>
      feedLostItems.removeAt(index);
  void insertAtIndexInFeedLostItems(int index, FeedLostItemsRow item) =>
      feedLostItems.insert(index, item);
  void updateFeedLostItemsAtIndex(
          int index, Function(FeedLostItemsRow) updateFn) =>
      feedLostItems[index] = updateFn(feedLostItems[index]);

  bool filterBy = false;

  String sortBy = 'Newest First';

  String activeFilter = 'none';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - generateGreetingMessage] action in dashboard widget.
  UserGreetingMessageStruct? generatedGreetingMessage;
  // Stores action output result for [Custom Action - getCategories] action in dashboard widget.
  List<CategoriesStruct>? fetchedCategories;
  // Stores action output result for [Custom Action - getSortedFeed] action in dashboard widget.
  List<FeedItemsRow>? initialFeedRows;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getSortedFeed] action in DropDown widget.
  List<FeedItemsRow>? sortedFeedRows;
  // Models for lostItemCard dynamic component.
  late FlutterFlowDynamicModels<LostItemCardModel> lostItemCardModels1;
  // Models for lostItemCard dynamic component.
  late FlutterFlowDynamicModels<LostItemCardModel> lostItemCardModels2;

  @override
  void initState(BuildContext context) {
    lostItemCardModels1 = FlutterFlowDynamicModels(() => LostItemCardModel());
    lostItemCardModels2 = FlutterFlowDynamicModels(() => LostItemCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    lostItemCardModels1.dispose();
    lostItemCardModels2.dispose();
  }
}
