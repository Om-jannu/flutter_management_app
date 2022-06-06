import 'package:flutter/material.dart';
import 'package:flutter_csi/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset(
                  "assets/csi.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 15,),
               Text(
                 "Welcome Back",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 10),
               Text(
                 "Name",
                 style: TextStyle(
                   fontWeight: FontWeight.w500,
                   color: Colors.black,
                 ),
               ),
               SizedBox(height: 5,),
               Text(
                 "Email",
                 style: TextStyle(
                   fontWeight: FontWeight.w500,
                   color: Colors.black,
                 ),
               ),
               SizedBox(height: 15,),
               ActionChip(
                 label: Text("Logout"),
                 onPressed: (){
                   Navigator.pushReplacement((context), MaterialPageRoute(builder: (context)=>LoginScreen()));
                 }
                )
            ],
          ),
          ),
      ),
    );
  }
}