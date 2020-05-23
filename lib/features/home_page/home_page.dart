import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbit/features/home_page/home_page_search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10.0)),
          child: new CircleAvatar(
          ),
        ),
        actions: [
          IconButton(icon: new Icon(Icons.location_on), onPressed: () {}),
          IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: JobSearch());
              })
        ],
      ),
      // body: new SafeArea(
      //     child: new ListView(
      //   children: [
      //     Container(
      //       color: Colors.indigo,
      //       height: screenHeight * 0.2,
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //                 horizontal: ScreenUtil().setWidth(50.0),
      //                 vertical: ScreenUtil().setHeight(20.0)),
      //             child: TextFormField(),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // )),
    );
  }
}
