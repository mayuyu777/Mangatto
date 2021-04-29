import 'package:mobdev_practice/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {
    String errorM = '';
    FirebaseAuth _auth = FirebaseAuth.instance;

      UserFirebase firebaseUser(User user){
        return user!=null? UserFirebase(uuid:user.uid): null;
      }

      Stream<UserFirebase> get user{
        return _auth.authStateChanges().map(firebaseUser);
      }
      Future signIn(String email,String password) async {
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,password: password
            );
            return firebaseUser(userCredential.user);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              errorM = 'Account does not exist.';
            } else if (e.code == 'wrong-password') {
              errorM ='Incorrect password.';
            }
          }
      }

      Future signUp(String email, String password) async {
          try {
             UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,password: password
            );
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