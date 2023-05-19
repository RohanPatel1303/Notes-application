import 'package:flutter/material.dart';
import 'package:sqflitefirstproject/pages/notepage.dart';
import 'package:get/get.dart';
import 'package:sqflitefirstproject/pages/splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.grey
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: NotesHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}