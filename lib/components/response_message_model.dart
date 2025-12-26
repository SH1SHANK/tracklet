import '/flutter_flow/flutter_flow_util.dart';
import 'response_message_widget.dart' show ResponseMessageWidget;
import 'package:flutter/material.dart';

class ResponseMessageModel extends FlutterFlowModel<ResponseMessageWidget> {
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

  bool isDataUploading_uploadDataMessageConversation = false;
  FFUploadedFile uploadedLocalFile_uploadDataMessageConversation =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataMessageConversation = '';

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
