import '/backend/supabase/supabase.dart';
import '/components/user_my_claim_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manage_responses_widget.dart' show ManageResponsesWidget;
import 'package:flutter/material.dart';

class ManageResponsesModel extends FlutterFlowModel<ManageResponsesWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ClaimsRow>>? manageResponsesSupabaseStream;
  // Models for userMyClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserMyClaimCardModel> userMyClaimCardModels;

  @override
  void initState(BuildContext context) {
    userMyClaimCardModels =
        FlutterFlowDynamicModels(() => UserMyClaimCardModel());
  }

  @override
  void dispose() {
    userMyClaimCardModels.dispose();
  }
}
