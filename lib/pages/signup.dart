import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trafficassister/pages/login.dart';
import 'package:trafficassister/backend/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController mailControl=TextEditingController();
  TextEditingController passControl=TextEditingController();
  TextEditingController confirmPass=TextEditingController();
  //FirebaseAuthService fb =FirebaseAuthService();
  bool matches=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 50,),
              CircleAvatar(
                backgroundColor: Colors.red.shade50,
                radius: 50,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(left: 25,right: 25),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244,157,162,1),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                height: 70,
                child: TextField(
                  controller: mailControl,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 25,right: 25),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244,157,162,1),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                height: 70,
                child: TextField(
                  obscureText: true,
                  controller: passControl,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 25,right: 25),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244,157,162,1),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                height: 70,
                child: TextField(
                  controller: confirmPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 120,
                height: 65,
                child: Center(child: TextButton(
                    onPressed: ()async{
                      if(passControl.text==confirmPass.text){
                        await Firebas().signUp(mailControl.text, passControl.text);
                      }
                    },
                    child: Text("REGISTER",style: TextStyle(color:Colors.white),))),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(244, 157, 162, 1)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                  }, child: Text("Sign In")),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
