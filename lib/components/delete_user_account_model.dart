import '/flutter_flow/flutter_flow_util.dart';
import 'delete_user_account_widget.dart' show DeleteUserAccountWidget;
import 'package:flutter/material.dart';

class DeleteUserAccountModel extends FlutterFlowModel<DeleteUserAccountWidget> {
  ///  Local state fields for this component.

  bool usernameBoolean = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
