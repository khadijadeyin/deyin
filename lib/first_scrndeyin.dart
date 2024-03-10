import 'package:deyin/app_constantsdeyin.dart';
import 'package:deyin/configdeyin.dart';
import 'package:deyin/login_scrndeyin.dart';
import 'package:deyin/my_buttondeyin.dart';
import 'package:deyin/signup_scrndeyin.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.green,
        elevation: 0.0,
       title: Text("رمضار كريم تقبل الله منا ومنكم", 
        style: TextStyle(color: Colors.black, 
        fontSize: 25.0,
         fontWeight: FontWeight.bold),),
       ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: AppBar().preferredSize.height * 3),
              CircleAvatar(
        radius:90, backgroundImage: NetworkImage('assets/images/logo.png'
          )
     ,),
        
            SizedBox(height: fullHeight(context) * 0.04),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.07),
                child: Text(
                  "Bienvenue sur le portail de notre projet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize10(context) * 1.45),
                )),
            SizedBox(height: fullHeight(context) * 0.03),
            Center(
              child: Text("se connecté",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize10(context) * 1.85)),
            ),
            SizedBox(height: fullHeight(context) * 0.04),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                title: 'Log In'),
            SizedBox(height: fullHeight(context) * 0.02),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              title: 'Sign Up',
              color: AppConstants.buttonColor.withOpacity(0.9),
              textColor: AppConstants.secondColor,
            ),
            SizedBox(height: fullHeight(context) * 0.03),
            Center(
              child: SizedBox(
                width: fullWidth(context) * 0.75,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Créer un compte",
                    style: TextStyle(
                        fontSize: fontSize10(context) * 1.85,
                        color: Colors.green,
                        fontWeight: FontWeight.w600),
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
