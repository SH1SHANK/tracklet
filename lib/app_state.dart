import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _primaryGreetingMessage = '';
  String get primaryGreetingMessage => _primaryGreetingMessage;
  set primaryGreetingMessage(String value) {
    _primaryGreetingMessage = value;
  }

  String _secondaryGreetingMessage = '';
  String get secondaryGreetingMessage => _secondaryGreetingMessage;
  set secondaryGreetingMessage(String value) {
    _secondaryGreetingMessage = value;
  }
}
