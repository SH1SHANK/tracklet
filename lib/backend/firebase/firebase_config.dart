import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCsckRnabjXGc9FhbzIUOLUyiEbiblQ5Aw",
            authDomain: "tracklet-z8jijr.firebaseapp.com",
            projectId: "tracklet-z8jijr",
            storageBucket: "tracklet-z8jijr.firebasestorage.app",
            messagingSenderId: "472212814302",
            appId: "1:472212814302:web:0b3d96a652275c03bfc54f"));
  } else {
    await Firebase.initializeApp();
  }
}
