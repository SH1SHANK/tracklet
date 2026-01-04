import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_location_on_map_widget.dart' show ChooseLocationOnMapWidget;
import 'package:flutter/material.dart';

class ChooseLocationOnMapModel
    extends FlutterFlowModel<ChooseLocationOnMapWidget> {
  ///  Local state fields for this component.

  LatLng? userChoosenLocation;

  bool isLocationChoosen = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
