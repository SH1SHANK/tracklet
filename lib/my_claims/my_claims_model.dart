import '/components/user_my_claim_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'my_claims_widget.dart' show MyClaimsWidget;
import 'package:flutter/material.dart';

class MyClaimsModel extends FlutterFlowModel<MyClaimsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for userMyClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserMyClaimCardModel> userMyClaimCardModels1;
  // Models for userMyClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserMyClaimCardModel> userMyClaimCardModels2;
  // Models for userMyClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserMyClaimCardModel> userMyClaimCardModels3;
  // Models for userMyClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserMyClaimCardModel> userMyClaimCardModels4;

  @override
  void initState(BuildContext context) {
    userMyClaimCardModels1 =
        FlutterFlowDynamicModels(() => UserMyClaimCardModel());
    userMyClaimCardModels2 =
        FlutterFlowDynamicModels(() => UserMyClaimCardModel());
    userMyClaimCardModels3 =
        FlutterFlowDynamicModels(() => UserMyClaimCardModel());
    userMyClaimCardModels4 =
        FlutterFlowDynamicModels(() => UserMyClaimCardModel());
  }

  @override
  void dispose() {
    userMyClaimCardModels1.dispose();
    userMyClaimCardModels2.dispose();
    userMyClaimCardModels3.dispose();
    userMyClaimCardModels4.dispose();
  }
}
