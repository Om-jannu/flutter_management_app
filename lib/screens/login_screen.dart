import 'dart:ffi';

import 'package:flutter/material.dart';
import "./registration_screen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    final emailField = TextField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      onSubmitted : (value){
        emailcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Email..",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );

    final passwordField = TextField(
      obscureText: true,
      autofocus: false,
      controller: passwordcontroller,
      onSubmitted : (value){
        passwordcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"password..",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );
    
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        child: Text("LOGIN"),
        onPressed: (){},
      )
    );



    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/csi.png",
                        fit: BoxFit.contain,
                        ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    loginbutton,
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text("Don't have any Account , "),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,MaterialPageRoute(builder: (context) => 
                              RegistrationScreen(),
                              )
                            );
                          },
                          child: Text("SIGN UP",style:TextStyle(
                            fontSize:15,
                            fontWeight: FontWeight.w800,
                            color: Colors.amber
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}