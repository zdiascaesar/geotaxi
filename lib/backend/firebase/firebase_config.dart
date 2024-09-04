import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAZVvt6MKmCRBOuXU8zRN_Teh-QjgzDz4g",
            authDomain: "geo-taxi-zosi7j.firebaseapp.com",
            projectId: "geo-taxi-zosi7j",
            storageBucket: "geo-taxi-zosi7j.appspot.com",
            messagingSenderId: "237031142553",
            appId: "1:237031142553:web:ceafd2abec04c95b2cb408"));
  } else {
    await Firebase.initializeApp();
  }
}
