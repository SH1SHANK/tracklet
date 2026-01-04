import '/backend/supabase/supabase.dart';
import '/components/conversation_closed_state_widget.dart';
import '/components/conversation_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_claim_card_widget.dart' show UserClaimCardWidget;
import 'package:flutter/material.dart';

class UserClaimCardModel extends FlutterFlowModel<UserClaimCardWidget> {
  ///  State fields for stateful widgets in this component.

  Stream<List<ClaimMessagesRow>>? listViewSupabaseStream;
  // Models for conversationContainer dynamic component.
  late FlutterFlowDynamicModels<ConversationContainerModel>
      conversationContainerModels;
  // Model for conversationClosedState component.
  late ConversationClosedStateModel conversationClosedStateModel;

  @override
  void initState(BuildContext context) {
    conversationContainerModels =
        FlutterFlowDynamicModels(() => ConversationContainerModel());
    conversationClosedStateModel =
        createModel(context, () => ConversationClosedStateModel());
  }

  @override
  void dispose() {
    conversationContainerModels.dispose();
    conversationClosedStateModel.dispose();
  }
}
