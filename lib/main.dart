import 'package:flutter/material.dart';
import 'Home.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor:Colors.black,
          iconTheme: const IconThemeData(color: Colors.white,size: 100),
          textTheme: const TextTheme(
            headline1:
                TextStyle(fontSize: 50, fontWeight: FontWeight.w800,color: Colors.white),
            headline2:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
            bodyText1: TextStyle(fontSize: 20,color:Colors.black)
          )),
      home: const MyHome(),
    );
  }
}
