import '/flutter_flow/flutter_flow_util.dart';
import 'reject_claim_widget.dart' show RejectClaimWidget;
import 'package:flutter/material.dart';

class RejectClaimModel extends FlutterFlowModel<RejectClaimWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - rejectClaim] action in Button widget.
  bool? rejectedClaim;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
