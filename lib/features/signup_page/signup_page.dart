import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orbit/core/authentication/Authentication.dart';
import 'package:orbit/features/login_page/login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  Authentication _authentication;
  TextEditingController _fullnameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _countryCode;
  TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _fullnameController = new TextEditingController();
    _authentication = new Authentication();
    _emailController = new TextEditingController();
    _phoneController = new TextEditingController();
    _countryCode = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(60.0),
            right: ScreenUtil().setWidth(60.0)),
        child: new ListView(children: <Widget>[
          new Text(
            "Setting up profile",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(65.0),
                fontWeight: FontWeight.w600),
          ),
          new ProfilePicture(),
          new TextField(
            controller: _fullnameController,
            style: new TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
            decoration: new InputDecoration(
                icon: Icon(Icons.person_outline),
                border: new OutlineInputBorder(),
                hintText: "Full Name",
                helperText: "Full Name"),
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(30.0),
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
              controller: _passwordController,
              obscureText: true,
              style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  icon: Icon(Icons.keyboard),
                  border: new OutlineInputBorder(),
                  hintText: "########",
                  helperText: "Password")),
          new SizedBox(
            height: ScreenUtil().setHeight(30.0),
          ),
          new Text(
            "Contact details",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(50.0),
                fontWeight: FontWeight.w600),
          ),
          new PhoneNumberCollector(phoneController: _phoneController),
          new SizedBox(
            height: ScreenUtil().setHeight(60.0),
          ),
          new Container(
            height: ScreenUtil().setHeight(105.0),
            child: RaisedButton(
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.white, width: 1)),
              onPressed: () {},
              child: new Text(
                "Sign up",
                style: new TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).textSelectionColor,
                    fontSize: ScreenUtil().setSp(65.0),
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(50.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Already have an account?",
                style: new TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: ScreenUtil().setSp(50.0),
                ),
              ),
              new SizedBox(
                width: ScreenUtil().setWidth(40.0),
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: new Text(
                  "Login",
                  style: new TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: ScreenUtil().setSp(50.0),
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class PhoneNumberCollector extends StatelessWidget {
  const PhoneNumberCollector({
    Key key,
    @required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          flex: 3,
          child: new TextField(
            keyboardType: TextInputType.number,
            cursorColor: Theme.of(context).primaryColor,
            style: new TextStyle(color: Colors.white, fontFamily: "Nunito"),
            decoration: new InputDecoration(
                prefixIcon: new Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                helperText: 'Country code'),
          ),
        ),
        new SizedBox(
          width: ScreenUtil().setWidth(20.0),
        ),
        new Expanded(
            flex: 7,
            child: new TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).primaryColor,
              style: new TextStyle(color: Colors.white, fontFamily: "Nunito"),
              decoration: new InputDecoration(helperText: 'Phone number'),
            )),
      ],
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File _profileImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = image;
      print(_profileImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Center(
        // color: Colors.black26,
        child: Stack(
          children: <Widget>[
            new ClipRRect(
                borderRadius: new BorderRadius.circular(100),
                child: Image(
                  width: ScreenUtil().setWidth(450),
                  height: ScreenUtil().setWidth(450),
                  image: _profileImage == null
                      ? new AssetImage('assets/images/no_profile_pic.png')
                      : FileImage(_profileImage),
                )),
            new Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 2.0))
                    ]),
                child: new IconButton(
                  onPressed: getImage,
                  icon: new Icon(Icons.add_a_photo),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
