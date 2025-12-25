import '/flutter_flow/flutter_flow_util.dart';
import 'lost_item_card_widget.dart' show LostItemCardWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class LostItemCardModel extends FlutterFlowModel<LostItemCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
