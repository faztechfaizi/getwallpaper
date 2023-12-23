import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();


 signInWithGoogle() async {
   final GoogleSignInAccount ? gUser = await GoogleSignIn().signIn();

   final GoogleSignInAuthentication gAuth = await gUser!.authentication;

   final credential = GoogleAuthProvider.credential(
     accessToken: gAuth.accessToken,
     idToken: gAuth.idToken
   );
   return await FirebaseAuth.instance.signInWithCredential(credential);
 }
  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

  }
}

void signInGoogle(BuildContext context) async {
  await FirebaseServices().signInWithGoogle();
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
}







