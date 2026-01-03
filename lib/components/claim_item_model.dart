import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'claim_item_widget.dart' show ClaimItemWidget;
import 'package:flutter/material.dart';

class ClaimItemModel extends FlutterFlowModel<ClaimItemWidget> {
  ///  Local state fields for this component.

  List<String> proofImages = [];
  void addToProofImages(String item) => proofImages.add(item);
  void removeFromProofImages(String item) => proofImages.remove(item);
  void removeAtIndexFromProofImages(int index) => proofImages.removeAt(index);
  void insertAtIndexInProofImages(int index, String item) =>
      proofImages.insert(index, item);
  void updateProofImagesAtIndex(int index, Function(String) updateFn) =>
      proofImages[index] = updateFn(proofImages[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataClaim = false;
  FFUploadedFile uploadedLocalFile_uploadDataClaim =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataClaim = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ClaimsRow? claimRowDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
