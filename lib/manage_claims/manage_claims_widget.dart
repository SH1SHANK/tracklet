import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/user_claim_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'manage_claims_model.dart';
export 'manage_claims_model.dart';

/// Design a "Manage Claims" page for a specific item.
///
/// Header: At the top, show a compact summary of the item being claimed,
/// including a small thumbnail, title, and a "Total Claims" count. Main
/// Content: Below the header, implement a vertical ListView of claim cards.
/// Claim Card Layout: Each card features the claimer’s name, a
/// "Pending/Accepted/Rejected" status badge, and the "Created At" timestamp.
/// Below the name, include a "Message" block for the claimer's text. Proof
/// Gallery: Add a horizontal row of small square images representing the
/// "proof_images" array. Action Section: At the bottom of each pending card,
/// place two prominent CTA buttons: a solid green "Accept" button and an
/// outlined red "Reject" button. Response Area: For processed claims, show a
/// "Your Response" text area displaying the "response_message." Use a clean,
/// inbox-style UI with distinct dividers and high-contrast touch targets for
/// all actions.
class ManageClaimsWidget extends StatefulWidget {
  const ManageClaimsWidget({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.itemCreatedAt,
    required this.itemImageUrl,
  });

  final String? itemId;
  final String? itemName;
  final DateTime? itemCreatedAt;
  final String? itemImageUrl;

  static String routeName = 'manageClaims';
  static String routePath = '/manageClaims';

  @override
  State<ManageClaimsWidget> createState() => _ManageClaimsWidgetState();
}

class _ManageClaimsWidgetState extends State<ManageClaimsWidget> {
  late ManageClaimsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageClaimsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ClaimsRow>>(
      stream: _model.manageClaimsSupabaseStream ??= SupaFlow.client
          .from("claims")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'item_id',
            widget.itemId,
          )
          .order('created_at')
          .map((list) => list.map((item) => ClaimsRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ClaimsRow> manageClaimsClaimsRowList = snapshot.data!;

        return Title(
            title: 'manageClaims',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  title: Text(
                    'Manage Claims',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.itemImageUrl,
                                        'https://images.unsplash.com/photo-1629639944517-de080f51c64a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjY2ODQwNzh8&ixlib=rb-4.1.0&q=80&w=1080',
                                      ),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.itemName,
                                            'Item Name Not Defined',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat("relative",
                                                widget.itemCreatedAt),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Total Claims: ${valueOrDefault<String>(
                                                  manageClaimsClaimsRowList
                                                      .length
                                                      .toString(),
                                                  '0',
                                                )}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final manageClaimsVar =
                                  manageClaimsClaimsRowList.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: manageClaimsVar.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 6.0),
                                itemBuilder: (context, manageClaimsVarIndex) {
                                  final manageClaimsVarItem =
                                      manageClaimsVar[manageClaimsVarIndex];
                                  return wrapWithModel(
                                    model: _model.userClaimCardModels.getModel(
                                      manageClaimsVarItem.id,
                                      manageClaimsVarIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: UserClaimCardWidget(
                                      key: Key(
                                        'Keyclo_${manageClaimsVarItem.id}',
                                      ),
                                      username:
                                          manageClaimsVarItem.claimerUsername!,
                                      userDescription:
                                          manageClaimsVarItem.message,
                                      claimStatus: manageClaimsVarItem.status,
                                      createdAt: manageClaimsVarItem.createdAt,
                                      proofImages:
                                          manageClaimsVarItem.proofImages,
                                      userContactInfo: UserContactInfoStruct(
                                        name:
                                            UserContactInfoStruct.maybeFromMap(
                                                    manageClaimsVarItem
                                                        .contactInfo)
                                                ?.name,
                                        email:
                                            UserContactInfoStruct.maybeFromMap(
                                                    manageClaimsVarItem
                                                        .contactInfo)
                                                ?.email,
                                        phone:
                                            UserContactInfoStruct.maybeFromMap(
                                                    manageClaimsVarItem
                                                        .contactInfo)
                                                ?.phone,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
