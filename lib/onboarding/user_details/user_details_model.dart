import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:flutter/material.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  FocusNode? usernameFocusNode1;
  TextEditingController? usernameTextController1;
  String? Function(BuildContext, String?)? usernameTextController1Validator;
  String? _usernameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name can’t be empty';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 24) {
      return 'Maximum 24 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for semester widget.
  int? semesterValue;
  FormFieldController<int>? semesterValueController;
  // State field(s) for branch widget.
  String? branchValue;
  FormFieldController<String>? branchValueController;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode2;
  TextEditingController? usernameTextController2;
  String? Function(BuildContext, String?)? usernameTextController2Validator;
  // State field(s) for userBio widget.
  FocusNode? userBioFocusNode;
  TextEditingController? userBioTextController;
  String? Function(BuildContext, String?)? userBioTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    usernameTextController1Validator = _usernameTextController1Validator;
  }

  @override
  void dispose() {
    usernameFocusNode1?.dispose();
    usernameTextController1?.dispose();

    usernameFocusNode2?.dispose();
    usernameTextController2?.dispose();

    userBioFocusNode?.dispose();
    userBioTextController?.dispose();
  }
}
