import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbit/features/login_page/login_page.dart';
import 'package:orbit/features/wrapper_page/wrapper_page.dart';
import 'package:orbit/repositories/loggedin_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoggedBloc>(
          create: (BuildContext context) => LoggedBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            secondaryHeaderColor: Color.fromRGBO(246, 125, 156, 1),
            primaryColor: Color.fromRGBO(252, 191, 222, 1),
            accentColor: Color.fromRGBO(238, 65, 99, 1.0),
            textSelectionColor: Color.fromRGBO(63, 62, 94, 1.0)),
        home: WrapperScreen(),
      ),
    );
  }
}
