import '/backend/supabase/supabase.dart';
import '/components/user_claim_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manage_claims_widget.dart' show ManageClaimsWidget;
import 'package:flutter/material.dart';

class ManageClaimsModel extends FlutterFlowModel<ManageClaimsWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ClaimsRow>>? manageClaimsSupabaseStream;
  // Models for userClaimCard dynamic component.
  late FlutterFlowDynamicModels<UserClaimCardModel> userClaimCardModels;

  @override
  void initState(BuildContext context) {
    userClaimCardModels = FlutterFlowDynamicModels(() => UserClaimCardModel());
  }

  @override
  void dispose() {
    userClaimCardModels.dispose();
  }
}
