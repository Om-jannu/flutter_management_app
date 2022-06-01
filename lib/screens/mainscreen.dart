import "package:flutter/material.dart";
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Material(
        child: Center(
          child: Text("hello world")
        ),
      ) 
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }