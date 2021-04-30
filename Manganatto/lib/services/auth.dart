import 'package:mobdev_practice/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobdev_practice/main/home.dart';
import 'package:flutter/material.dart';

class Authenticate {
    String errorM = '';
    FirebaseAuth _auth = FirebaseAuth.instance;

      UserFirebase firebaseUser(User user){
        return user!=null? UserFirebase(uuid:user.uid): null;
      }

      Stream<UserFirebase> get user{
        return _auth.authStateChanges().map(firebaseUser);
      }
      Future signIn(BuildContext context,String email,String password) async {
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,password: password
            );
            if(userCredential!=null){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Homepage()));
            }
            return firebaseUser(userCredential.user);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              errorM = 'Account does not exist.';
            } else if (e.code == 'wrong-password') {
              errorM ='Incorrect password.';
            }
          }
      }

      Future signUp(BuildContext context,String email, String password) async {
          try {
             UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,password: password
            );
            if(userCredential!=null){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Homepage()));
            }
             return firebaseUser(userCredential.user);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'email-already-in-use') {
                errorM ='An account already exist.';
            }
          } catch (e) {
            print(e);
          }
      }


      Future logout() async{
        try {
          return await _auth.signOut();
        } catch (error) {
          print(error.toString());
          return null;
        }
      }
      
}