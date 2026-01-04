import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'found_item_widget.dart' show FoundItemWidget;
import 'package:flutter/material.dart';

class FoundItemModel extends FlutterFlowModel<FoundItemWidget> {
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
  bool isDataUploading_uploadDataFound = false;
  FFUploadedFile uploadedLocalFile_uploadDataFound =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataFound = '';

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
