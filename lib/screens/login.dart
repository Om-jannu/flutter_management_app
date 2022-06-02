import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './profilescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


TextEditingController emailcontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();
static Future<User?> loginUsingEmailPassword(String _email , String _password, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: _email, password: _password);
    user = userCredential.user;
  }
  on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("no user found with that email");
      }
    }
    return user;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LOGIN \ SIGN UP"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email...",
                    prefixIcon: Icon(Icons.mail, color: Colors.black,)
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password...",
                    prefixIcon: Icon(Icons.lock ,color: Colors.black,)
                    )
                ),
              ),
              Container(
                width:double.infinity ,
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            child:ElevatedButton(
              child:Text("Login"),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(emailcontroller.text,passwordcontroller.text, context);
                print(user);
                if(user != Null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProfileScreen())
                  );
                }
              },
            )
                ),
            ],
          ),
          ),
      );
  }
}


