// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sqflitefirstproject/pages/login.dart';
// import 'package:sqflitefirstproject/pages/notepage.dart';
// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   void initState(){
//     super.initState();
//     navigate();
//     print("helooo");
//
//   }
// void navigate()async{
//   SharedPreferences prefs=await SharedPreferences.getInstance();
//   bool? keeploggedin=await prefs.getBool("Logged");
//   print(keeploggedin);
//   Timer(Duration(seconds: 4), () async {
//     print("i am executed");
//
//     if(keeploggedin==null||keeploggedin==false)
//     {
//       print(keeploggedin);
//       Get.offAll(Login());
//     }
//     else{
//       Get.offAll(NotesHome());
//     }
//
//   });
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(color: Colors.blue),
//       ),
//     );
//   }
// }
