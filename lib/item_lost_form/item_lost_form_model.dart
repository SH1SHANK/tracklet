import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'item_lost_form_widget.dart' show ItemLostFormWidget;
import 'package:flutter/material.dart';

class ItemLostFormModel extends FlutterFlowModel<ItemLostFormWidget> {
  ///  Local state fields for this page.

  List<String> userUploadedPhotos = [];
  void addToUserUploadedPhotos(String item) => userUploadedPhotos.add(item);
  void removeFromUserUploadedPhotos(String item) =>
      userUploadedPhotos.remove(item);
  void removeAtIndexFromUserUploadedPhotos(int index) =>
      userUploadedPhotos.removeAt(index);
  void insertAtIndexInUserUploadedPhotos(int index, String item) =>
      userUploadedPhotos.insert(index, item);
  void updateUserUploadedPhotosAtIndex(int index, Function(String) updateFn) =>
      userUploadedPhotos[index] = updateFn(userUploadedPhotos[index]);

  FFPlace? userChoosenLocationPageState;

  DateTime? userPickedDate;

  UserContactInfoStruct? userContactInfo;
  void updateUserContactInfoStruct(Function(UserContactInfoStruct) updateFn) {
    updateFn(userContactInfo ??= UserContactInfoStruct());
  }

  String intent = 'lost';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for itemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  String? _itemNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., Black Wallet, Calculator, Earphones is required';
    }

    return null;
  }

  // State field(s) for itemDescription widget.
  FocusNode? itemDescriptionFocusNode;
  TextEditingController? itemDescriptionTextController;
  String? Function(BuildContext, String?)?
      itemDescriptionTextControllerValidator;
  String? _itemDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., Blue Samsung phone with a cracked corner and floral case is required';
    }

    return null;
  }

  // State field(s) for itemCategory widget.
  int? itemCategoryValue;
  FormFieldController<int>? itemCategoryValueController;
  // State field(s) for lastSeenLocation widget.
  FocusNode? lastSeenLocationFocusNode;
  TextEditingController? lastSeenLocationTextController;
  String? Function(BuildContext, String?)?
      lastSeenLocationTextControllerValidator;
  String? _lastSeenLocationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., Mechanical Block – Heat Transfer Lab is required';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - chooseLocationOnMap] action in Container widget.
  LatLng? userSelectedLocation;
  // Stores action output result for [Custom Action - convertLatLngToGooglePlace] action in Container widget.
  FFPlace? userChoosenLocation;
  // Stores action output result for [Custom Action - parseToGooglePlaceDataType] action in Container widget.
  GooglePlaceStruct? parsedGooglePlaceStruct;
  DateTime? datePicked;
  bool isDataUploading_uploadDataLostFoundForm = false;
  FFUploadedFile uploadedLocalFile_uploadDataLostFoundForm =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataLostFoundForm = '';

  // State field(s) for userContactName widget.
  FocusNode? userContactNameFocusNode;
  TextEditingController? userContactNameTextController;
  String? Function(BuildContext, String?)?
      userContactNameTextControllerValidator;
  String? _userContactNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., John Doe is required';
    }

    return null;
  }

  // State field(s) for userContactNumber widget.
  FocusNode? userContactNumberFocusNode;
  TextEditingController? userContactNumberTextController;
  String? Function(BuildContext, String?)?
      userContactNumberTextControllerValidator;
  String? _userContactNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., 1800123491 is required';
    }

    return null;
  }

  // State field(s) for userContactEmail widget.
  FocusNode? userContactEmailFocusNode;
  TextEditingController? userContactEmailTextController;
  String? Function(BuildContext, String?)?
      userContactEmailTextControllerValidator;
  String? _userContactEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'e.g., JohnDoe@gmail.com is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ItemsRow? listedItemRow;

  @override
  void initState(BuildContext context) {
    itemNameTextControllerValidator = _itemNameTextControllerValidator;
    itemDescriptionTextControllerValidator =
        _itemDescriptionTextControllerValidator;
    lastSeenLocationTextControllerValidator =
        _lastSeenLocationTextControllerValidator;
    userContactNameTextControllerValidator =
        _userContactNameTextControllerValidator;
    userContactNumberTextControllerValidator =
        _userContactNumberTextControllerValidator;
    userContactEmailTextControllerValidator =
        _userContactEmailTextControllerValidator;
  }

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    itemDescriptionFocusNode?.dispose();
    itemDescriptionTextController?.dispose();

    lastSeenLocationFocusNode?.dispose();
    lastSeenLocationTextController?.dispose();

    userContactNameFocusNode?.dispose();
    userContactNameTextController?.dispose();

    userContactNumberFocusNode?.dispose();
    userContactNumberTextController?.dispose();

    userContactEmailFocusNode?.dispose();
    userContactEmailTextController?.dispose();
  }
}
