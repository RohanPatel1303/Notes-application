// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflitefirstproject/pages/notepage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool checkflag=true;
//   String username="";
//   Future<void> setSharedPreferences() async {
//     print("hello guys");
//     SharedPreferences prefs=await SharedPreferences.getInstance();
//     await prefs.setString("UserName", username);
//     await prefs.setBool("Logged",checkflag);
//     print("executed");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children:[
//             const SizedBox(
//               height: 200,
//             ),
//             const Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'User Name',
//                     hintText: 'User Name'),
//                     onChanged: (){
//                       setState(() {
//                         username=text1;
//                       });
//                     },
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
//             const SizedBox(height: 20,),
//             StatefulBuilder(builder: (BuildContext context,StateSetter setState){
//               return
//                 CheckboxListTile(
//                     title: const Text("Keep Me Logged In"),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     value: checkflag,checkColor: Colors.white, onChanged: (bool? value){
//                   setState(() {
//                     checkflag=value!;
//                   });
//                 });
//             }),
//
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.defaultDialog(
//                     cancel:
//                     GestureDetector(
//                       onTap: ()=>{Get.back()},
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 60),
//                         child: Column(
//                           children: [
//                             Text("Close")
//                           ],
//                         ),
//                       ),
//                     ),
//                     confirm: GestureDetector(
//                       onTap: ()=>{setSharedPreferences(),Get.back(),Get.off(NotesHome())
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 60),
//                         child: Column(
//                           children: [
//                             Text("Confirm")
//                           ],
//                         ),
//                       ),
//                     ),
//                     buttonColor: Colors.blue,
//                     contentPadding: EdgeInsets.all(20),
//                     middleText: "The Details You Have Entered Are Correct",
//                     backgroundColor: Colors.grey,
//                     title:"Do You Wish To Proceed",
//                     barrierDismissible: false,
//                     radius:20,
//                   );
//                   // setSharedPreferences();
//                   // Get.off(HomeScreen());
//
//                 },
//                 child: const Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
