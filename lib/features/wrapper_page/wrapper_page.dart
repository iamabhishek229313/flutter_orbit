import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbit/features/home_page/home_page.dart';
import 'package:orbit/features/login_page/login_page.dart';
import 'package:orbit/features/signup_page/signup_page.dart';
import 'package:orbit/repositories/loggedin_bloc.dart';

class WrapperScreen extends StatefulWidget {
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return new Scaffold(body: BlocBuilder<LoggedBloc, bool>(
      builder: (BuildContext context, bool isLogged) {
        return isLogged ? HomePage() : Wrapper();
      },
    ));
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Theme.of(context).accentColor),
        child: new Column(
          children: <Widget>[
            new Expanded(
                flex: 5,
                child: Center(
                    child: new Text(
                  "Orbit",
                  style: new TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: ScreenUtil().setSp(140.0),
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).textSelectionColor),
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
                      new SizedBox(height: ScreenUtil().setHeight(50.0)),
                      new Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(105.0),
                        child: new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0)),
                          color: Colors.white,
                          elevation: 10.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Login()));
                          },
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "LOG IN",
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
                      new SizedBox(height: ScreenUtil().setHeight(30.0)),
                      new Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(105.0),
                        child: new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0)),
                          color: Colors.white,
                          elevation: 10.0,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                          },
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "SIGN UP",
                                style: new TextStyle(
                                    fontFamily: 'Nunito',
                                    color:
                                        Theme.of(context).textSelectionColor,
                                    letterSpacing: 1.2),
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
        ));
  }
}
