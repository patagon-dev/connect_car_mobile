import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB1izzLT3uQBGdAM2LWh4XqBT7dezL1tBo",
            authDomain: "connect-car-85531.firebaseapp.com",
            projectId: "connect-car-85531",
            storageBucket: "connect-car-85531.appspot.com",
            messagingSenderId: "61195030950",
            appId: "1:61195030950:web:601034353e7d8b54067f67",
            measurementId: "G-7Q69WK5LLB"));
  } else {
    await Firebase.initializeApp();
  }
}
