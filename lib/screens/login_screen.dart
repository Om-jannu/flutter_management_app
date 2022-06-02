import 'package:flutter/material.dart';

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
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[

                  emailField,
                  passwordField,
                  loginbutton
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}