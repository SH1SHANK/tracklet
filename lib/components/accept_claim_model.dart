import '/flutter_flow/flutter_flow_util.dart';
import 'accept_claim_widget.dart' show AcceptClaimWidget;
import 'package:flutter/material.dart';

class AcceptClaimModel extends FlutterFlowModel<AcceptClaimWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - acceptClaim] action in Button widget.
  bool? claimAccepted;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
