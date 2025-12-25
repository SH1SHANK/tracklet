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

  String sortBy = 'Newest First';

  String activeFilter = 'none';

  bool filterBy = false;

  int? categoryId = 0;

  String? searchQuery;

  bool isSearchActive = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - generateGreetingMessage] action in dashboard widget.
  String? generatedGreetingMessage;
  // Stores action output result for [Custom Action - getCategories] action in dashboard widget.
  List<CategoriesStruct>? fetchedCategories;
  // Stores action output result for [Custom Action - renderFeed] action in dashboard widget.
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
  // Stores action output result for [Custom Action - renderFeed] action in TextField widget.
  List<FeedItemsRow>? renderedFeedItemsViaSearch;
  // Stores action output result for [Custom Action - renderFeed] action in IconButton widget.
  List<FeedItemsRow>? renderedFeedItemsViaFilter;
  // Stores action output result for [Custom Action - renderFeed] action in IconButton widget.
  List<FeedItemsRow>? renderedFeedItemsViaClearFilter;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - renderFeed] action in ChoiceChips widget.
  List<FeedItemsRow>? renderedFeedItems;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - renderFeed] action in DropDown widget.
  List<FeedItemsRow>? renderedFeedItemsViaSort;
  // Models for lostItemCard dynamic component.
  late FlutterFlowDynamicModels<LostItemCardModel> lostItemCardModels;

  @override
  void initState(BuildContext context) {
    lostItemCardModels = FlutterFlowDynamicModels(() => LostItemCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    lostItemCardModels.dispose();
  }
}
