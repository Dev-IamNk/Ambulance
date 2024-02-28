import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:trafficassister/pages/home.dart';
import 'package:trafficassister/pages/signup.dart';
import 'package:trafficassister/backend/auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final Firebas _auth = Firebas();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
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
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Password",
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
                     await Firebas().signIn(mail.text, pass.text).then((value) =>
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))
                     );
                      },
                      child: Text("LOGIN",style: TextStyle(color:Colors.white),))),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(244, 157, 162, 1)
                      ),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Dont have an Account?"),
                      TextButton(

                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>RegisterScreen()));
                  }, child: Text("Sign Up")),

                ],
              ),
            ],
          ),
        ],
      ),
    );

  }


}
