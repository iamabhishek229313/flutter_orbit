import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(60.0),
            left: ScreenUtil().setWidth(60.0),
            right: ScreenUtil().setWidth(60.0)),
        child: new ListView(
          children: <Widget>[
            new Text(
              "Welcome back!",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Theme.of(context).textSelectionColor,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(75.0),
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "we need few of our credentials",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(40.0),
                  fontWeight: FontWeight.w600),
            ),
            new SizedBox(
              height: ScreenUtil().setHeight(200),
            ),
            new TextField(
              controller: _emailController,
              style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  icon: Icon(Icons.alternate_email),
                  border: new OutlineInputBorder(),
                  hintText: "example@xyz.com",
                  helperText: "Your email"),
            ),
            new SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            new TextField(
              controller: _password,
              obscureText: true,
              style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  icon: Icon(Icons.keyboard),
                  border: new OutlineInputBorder(),
                  helperText: "Password"),
            ),
            new SizedBox(
              height: ScreenUtil().setHeight(80.0),
            ),
            new Login_Button()
          ],
        ),
      ),
    );
  }
}

class Login_Button extends StatelessWidget {
  const Login_Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(105.0),
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90.0)),
        color: Colors.white,
        elevation: 10.0,
        onPressed: () {
          // Will talk to the backend .
        },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "LOG IN",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Theme.of(context).textSelectionColor,
                  letterSpacing: 1.2),
            )
          ],
        ),
      ),
    );
  }
}
