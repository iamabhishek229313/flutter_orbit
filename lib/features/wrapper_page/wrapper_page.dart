import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orbit/features/home_page/home_page.dart';

class WrapperScreen extends StatefulWidget {
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.providerData.length == 1) {
            return snapshot.data.isEmailVerified ? HomePage() : GoogleSign();
          } else {
            return HomePage();
          }
        }
        return GoogleSign();
      },
    );
  }
}

class GoogleSign extends StatefulWidget {
  @override
  _GoogleSignState createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: gSA.accessToken, idToken: gSA.idToken);

    AuthResult result = await auth.signInWithCredential(credential);
    final FirebaseUser currentUser = await auth.currentUser();
    return currentUser;
  }

  Future signOut() async {
    await auth.signOut();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          decoration: new BoxDecoration(color: Theme.of(context).accentColor),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  flex: 5,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: new Image(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.8,
                            image: new AssetImage(
                                'assets/logo/cyan with glow.png')),
                      ),
                      new Text(
                        "Orbit",
                        style: new TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: ScreenUtil().setSp(140.0),
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).textSelectionColor),
                      ),
                    ],
                  ))),
              new Expanded(
                  flex: 3,
                  child: new Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(75.0)),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'By clicking "Log in",you agree with our Terms.\n Learn how we process your data in our Privacy  Policy and Cookies Policy',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(150.0)),
                        new Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 10.0,
                            onPressed: () async {
                              signIn();
                              print("Signed in");
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  FontAwesomeIcons.google,
                                  size: ScreenUtil().setSp(60),
                                ),
                                new SizedBox(
                                    width: ScreenUtil().setWidth(30.0)),
                                new Text(
                                  "CONTINUE WITH GOOGLE",
                                  style: new TextStyle(
                                      fontFamily: 'Nunito',
                                      color:
                                          Theme.of(context).textSelectionColor,
                                      letterSpacing: 1.2,
                                      wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        new SizedBox(height: ScreenUtil().setHeight(70.0)),
                        new Text(
                          "Trouble logging in?",
                          style: new TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(50.0),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
