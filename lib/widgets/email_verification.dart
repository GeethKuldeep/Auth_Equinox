import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sigin/home_page.dart';

class Verified extends StatefulWidget {
  @override
  _VerifiedState createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {

  final auth =FirebaseAuth.instance;
  FirebaseUser user;
  Timer timer;
  void authCurrentUser()async{
    user = await auth.currentUser();
  }

  bool verify =false;

  @override
  void initState(){
    authCurrentUser();

    timer= Timer.periodic(Duration(seconds: 5), (timer) {
      if(verify==false  &&  user !=null ){
        user.sendEmailVerification();
        print('email sent');
        verify =true;
      }

      checkEmailVerified();

    });
    super.initState();
  }


  Future<void> checkEmailVerified()async{

    user= await auth.currentUser();
    await user.reload();
    if(user.isEmailVerified && user != null){
      print('EMAIL VERIFIED');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));

    }
  }


  @override
  Widget build(BuildContext context) {
    const color = const Color(0xff0E1C36);
    var color1 = const Color(0xffFBD00D);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            children: [
        SizedBox(height: MediaQuery.of(context).size.width*0.645,),
      Image(image: AssetImage('images/Equinox Logo-02 4.png'),
        width: MediaQuery.of(context).size.width*0.23,
        height: MediaQuery.of(context).size.width*0.23,
      ),
              SizedBox(height: MediaQuery.of(context).size.width*0.07,),
      Divider(
        color: color1,
        thickness: 6,
      ),
              SizedBox(height: MediaQuery.of(context).size.width*0.07,),
              Center(child: Text('Email verification sent',style: TextStyle(fontSize: 28,color: Colors.white))),
              SizedBox(height: MediaQuery.of(context).size.width*0.07,),
              CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(color1),),
      ]
    ),
      ),
          backgroundColor: color,
    );
  }
  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }
}
