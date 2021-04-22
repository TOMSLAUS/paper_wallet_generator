import 'package:flutter/material.dart';
import 'package:paperwallet_generator/views/MainView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainView.id,
      routes: {
        MainView.id: (context) => MainView(),
      },
    );
  }
}
