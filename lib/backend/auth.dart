import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Firebas{




  final auth =FirebaseAuth.instance;
  User? get user => auth.currentUser;
  Stream<User?> get  authState  =>auth.authStateChanges();
  Future<void> signUp( email, pass)async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
    }
    catch (e){
      print(e.toString());
    }

  }
  Future<User?> signIn(String email,String password)async{
    try{
      UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<void> signingOut()async{
    await auth.signOut();
  }

}