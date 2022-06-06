// import 'package:firebase_core/firebase_core.dart';
// import "package:flutter/material.dart";
// import "./login_screen.dart";

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {

// Future<FirebaseApp> _initializeFirebase() async{
//   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   return firebaseApp;
//  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:FutureBuilder(
//         future: _initializeFirebase(),
//         builder: (context,snapshot){
//           if(snapshot.connectionState == ConnectionState.done){
//             return LoginScreen();
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//     )
//   );
//  }
// }