import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Void> signUp(String email, String password) async {
    print("Email " + email + "  Password    " + password);

    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    print("Logged in  :: " + user.toString());
  }

  Future<Void> signOut() async {
    await _auth.signOut();
    print("Logged out");
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whatsapp_redesign/Models/User.dart';

// class Authentication {
//   FirebaseAuth _auth = FirebaseAuth.instance ;

//   User _userFromFireBaseUser(FirebaseUser user){
//     return user != null ? User(uid : user.uid) : null ;
//   }

//   Stream<User> get user{
//     return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFireBaseUser(user));
//   }
//  //Sign in anon
//   Future SignInAnon() async{
//     try{
//       AuthResult result  = await _auth.signInAnonymously();
//       FirebaseUser user = result.user ;
//       return _userFromFireBaseUser(user);
//     }catch(ex){
//       print(ex.toString());
//       return null ;
//     }
//   }
//   // Sign In awith the Email and Password
//   Future signInWithEmailAndPassword(String email ,String password) async {
//     try{
//       AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
//       FirebaseUser user = result.user ;
//       return _userFromFireBaseUser(user);
//     }catch(ex){

//       print("hhgfhfh  " + ex.toString());
//       return null ;
//     }
//   }

//   // Register with the Email and Password .
//   Future registerWithEmailAndPassword(String email ,String password) async{
//     try{
//       AuthResult result = await _auth.createUserWithEmailAndPassword(email : email , password: password) ;
//       FirebaseUser user = result.user ;
//       return _userFromFireBaseUser(user);
//     }catch(ex){
//       print(ex.toString());
//       return null ;
//     }
//   }

//   // Sign out
//   Future signOut() async{
//     try{
//       return await _auth.signOut() ;
//     }catch(ex){
//       print(ex.toString());
//       return null ;
//     }
//   }

// }