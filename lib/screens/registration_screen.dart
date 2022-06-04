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
      keyboardType: TextInputType.emailAddress,
      onSubmitted : (value){
        firstnameeditcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintText:"Firstname...",
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(10)
        )
      )
    );

    return Container();
  }
  
}