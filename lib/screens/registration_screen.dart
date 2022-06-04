import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formkey = GlobalKey<FormState>();

  final firstnameeditcontroller = new TextEditingController();
  final lastnameeditcontroller = new TextEditingController();
  final emaileditcontroller = new TextEditingController();
  final passwordeditcontroller = new TextEditingController();
  final confirmpasswordeditcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final firstnameField = TextField(
      autofocus: false,
      controller: firstnameeditcontroller,
      keyboardType: TextInputType.text,
      onSubmitted : (value){
        firstnameeditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Firstname...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );
    final lastnameField = TextField(
      autofocus: false,
      controller: lastnameeditcontroller,
      keyboardType: TextInputType.text,
      onSubmitted : (value){
        lastnameeditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Lastname...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );
    final emailField = TextField(
      autofocus: false,
      controller: emaileditcontroller,
      keyboardType: TextInputType.emailAddress,
      onSubmitted : (value){
        emaileditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_outline),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Email...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );
    final passwordField = TextField(
      autofocus: false,
      controller: passwordeditcontroller,
      obscureText: true,
      keyboardType: TextInputType.text,
      onSubmitted : (value){
        passwordeditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Password...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );
    final confirmpasswordField = TextField(
      autofocus: false,
      controller: confirmpasswordeditcontroller,
      obscureText: true,
      keyboardType: TextInputType.text,
      onSubmitted : (value){
        confirmpasswordeditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key_rounded), 
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"ConfirmPassword...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );

    final signupbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        child: Text("SIGN UP"),
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
                key: _formkey,
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
                    firstnameField,
                    SizedBox(height: 25),
                    lastnameField,
                    SizedBox(height: 25),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    confirmpasswordField,
                    SizedBox(height: 25),
                    signupbutton,
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