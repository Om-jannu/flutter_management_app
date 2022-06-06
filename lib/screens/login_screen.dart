
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "./registration_screen.dart";
import "./profilescreen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress, 
      validator: (value){
        if(value!.isEmpty){
          return("Please enter your email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please enter valid email");
        }
      },
      onSaved: (value){
        emailcontroller.text = value!;
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

    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordcontroller,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
      },
      onSaved : (value){
        passwordcontroller.text = value!;
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
    
      void signin(String email, String password)async{
      if(formkey.currentState!.validate()){
        await _auth
        .signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
        Fluttertoast.showToast(msg: "Login Succesfull"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
      }
    }


    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        child: Text("LOGIN"),
        onPressed: (){
          signin(emailcontroller.text,passwordcontroller.text);
        },
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
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    loginbutton,
                    SizedBox(height: 25),
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
                    ),
                    SizedBox(height: 45),
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