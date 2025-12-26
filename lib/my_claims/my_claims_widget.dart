import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/user_my_claim_card_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_claims_model.dart';
export 'my_claims_model.dart';

/// Purpose: A tracking page for items the user has attempted to claim from
/// others.
///
/// Layout:
///
/// Navigation: Top tabs for "All," "Pending," "Accepted," and "Rejected."
///
/// Claim Cards: A vertical list where each card focuses on the item being
/// claimed. Includes the item thumbnail, title, the user's submitted message,
/// and a "Claim Status" indicator.
///
/// Status Specifics: Accepted claims show a highlighted "Contact Info
/// Revealed" section. Rejected claims show a placeholder for "Rejection
/// Reason."
///
/// Indicators: Timestamps for "Claimed On" and a "Waiting for Response"
/// visual cue for pending items.
///
/// Empty State: A clean layout suggesting the user browse the home page if
/// they haven't made any claims yet.
class MyClaimsWidget extends StatefulWidget {
  const MyClaimsWidget({super.key});

  static String routeName = 'myClaims';
  static String routePath = '/myClaims';

  @override
  State<MyClaimsWidget> createState() => _MyClaimsWidgetState();
}

class _MyClaimsWidgetState extends State<MyClaimsWidget> {
  late MyClaimsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyClaimsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'myClaims',
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
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(DashboardWidget.routeName);
                },
              ),
              title: Text(
                'My Claims',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      fontSize: 28.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 0.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('All'),
                        ChipData('Pending'),
                        ChipData('Accepted'),
                        ChipData('Rejected')
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).accent1,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                        iconColor: Color(0x00000000),
                        iconSize: 0.0,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                        iconColor: Color(0x00000000),
                        iconSize: 0.0,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      chipSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        ['All'],
                      ),
                      wrapped: false,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.choiceChipsValue == 'Pending') {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: FutureBuilder<List<ClaimsRow>>(
                              future: ClaimsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'claimer_user_id',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
                                      'status',
                                      'pending',
                                    )
                                    .order('created_at'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ClaimsRow> listViewClaimsRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    6.0,
                                    0,
                                    16.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewClaimsRowList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 6.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewClaimsRow =
                                        listViewClaimsRowList[listViewIndex];
                                    return wrapWithModel(
                                      model: _model.userMyClaimCardModels1
                                          .getModel(
                                        listViewClaimsRow.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: UserMyClaimCardWidget(
                                        key: Key(
                                          'Keyd1k_${listViewClaimsRow.id}',
                                        ),
                                        itemId: listViewClaimsRow.itemId,
                                        itemName: listViewClaimsRow.itemName!,
                                        claimMessage: listViewClaimsRow.message,
                                        claimStatus: listViewClaimsRow.status,
                                        claimedAt: listViewClaimsRow.createdAt,
                                        claimId: listViewClaimsRow.id,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else if (_model.choiceChipsValue == 'Accepted') {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: FutureBuilder<List<ClaimsRow>>(
                              future: ClaimsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'claimer_user_id',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
                                      'status',
                                      'accepted',
                                    )
                                    .order('created_at'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ClaimsRow> listViewClaimsRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    6.0,
                                    0,
                                    16.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewClaimsRowList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 6.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewClaimsRow =
                                        listViewClaimsRowList[listViewIndex];
                                    return wrapWithModel(
                                      model: _model.userMyClaimCardModels2
                                          .getModel(
                                        listViewClaimsRow.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: UserMyClaimCardWidget(
                                        key: Key(
                                          'Keykrw_${listViewClaimsRow.id}',
                                        ),
                                        itemId: listViewClaimsRow.itemId,
                                        itemName: listViewClaimsRow.itemName!,
                                        claimMessage: listViewClaimsRow.message,
                                        claimStatus: listViewClaimsRow.status,
                                        claimedAt: listViewClaimsRow.createdAt,
                                        claimId: listViewClaimsRow.id,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else if (_model.choiceChipsValue == 'Rejected') {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: FutureBuilder<List<ClaimsRow>>(
                              future: ClaimsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'claimer_user_id',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
                                      'status',
                                      'rejected',
                                    )
                                    .order('created_at'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ClaimsRow> listViewClaimsRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    6.0,
                                    0,
                                    16.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewClaimsRowList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 6.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewClaimsRow =
                                        listViewClaimsRowList[listViewIndex];
                                    return wrapWithModel(
                                      model: _model.userMyClaimCardModels3
                                          .getModel(
                                        listViewClaimsRow.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: UserMyClaimCardWidget(
                                        key: Key(
                                          'Keyjbd_${listViewClaimsRow.id}',
                                        ),
                                        itemId: listViewClaimsRow.itemId,
                                        itemName: listViewClaimsRow.itemName!,
                                        claimMessage: listViewClaimsRow.message,
                                        claimStatus: listViewClaimsRow.status,
                                        claimedAt: listViewClaimsRow.createdAt,
                                        claimId: listViewClaimsRow.id,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: FutureBuilder<List<ClaimsRow>>(
                              future: ClaimsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'claimer_user_id',
                                      currentUserUid,
                                    )
                                    .order('created_at'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ClaimsRow> listViewClaimsRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    6.0,
                                    0,
                                    16.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewClaimsRowList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 6.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewClaimsRow =
                                        listViewClaimsRowList[listViewIndex];
                                    return wrapWithModel(
                                      model: _model.userMyClaimCardModels4
                                          .getModel(
                                        listViewClaimsRow.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: UserMyClaimCardWidget(
                                        key: Key(
                                          'Key557_${listViewClaimsRow.id}',
                                        ),
                                        itemId: listViewClaimsRow.itemId,
                                        itemName: listViewClaimsRow.itemName!,
                                        claimMessage: listViewClaimsRow.message,
                                        claimStatus: listViewClaimsRow.status,
                                        claimedAt: listViewClaimsRow.createdAt,
                                        claimId: listViewClaimsRow.id,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
