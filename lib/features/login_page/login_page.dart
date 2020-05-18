import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Login extends StatefulWidget {
  final bool isMentor ;

  const Login({Key key, this.isMentor}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _collegenumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
      ),
      backgroundColor:Theme.of(context).backgroundColor,
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
                  color: Colors.white,
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
              controller: _collegenumberController,
              keyboardType: TextInputType.number,
              style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  icon: Icon(Icons.keyboard),
                  border: new OutlineInputBorder(),
                  hintText: widget.isMentor ? "SSID" : "Registration Number",
                  helperText:
                      widget.isMentor ? "Your SSID" : "Registration Number"),
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
    return new Container(
      height: ScreenUtil().setHeight(120.0),
      child: RaisedButton(
        color: Theme.of(context).backgroundColor,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Colors.white, width: 1)),
        onPressed: () {
         // Navigator.push(context , MaterialPageRoute(builder: (context) => StudentHomePage()));
          // Few Backend Stuffs ..
          // Thne go the Homapage after all signup things made .
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>  Check(userName: _controller.text)));
        },
        child: new Text(
          "Login",
          style: new TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: ScreenUtil().setSp(65.0),
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}