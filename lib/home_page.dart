import 'package:flutter/material.dart';
import 'package:google_sigin/sign_in/email_sigin_page.dart';
import 'package:provider/provider.dart';

import 'services/authentication.dart';


class HomePage extends StatelessWidget {


  Future<void> _signOut(BuildContext context) async {
    try {
      final auth=Provider.of<AuthBase>(context);
      await auth.signOut();
      print('logged out successfully 123');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            onPressed:(){
              _signOut(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> EmailSigninPage()));

              print('logged out successfully');
            },
          ),
        ],
      ),
      body: Row(
          children: [
            SizedBox(height: 50),
            Container(
              child: Text('Hey participant...you have successfully signed in',textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.lightGreenAccent,
            ),
        ],

      ),

      );
  }
}