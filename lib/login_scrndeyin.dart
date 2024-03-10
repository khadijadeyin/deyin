import 'package:deyin/configdeyin.dart';
import 'package:deyin/forgot_password_scrndeyin.dart';
import 'package:deyin/home_scrndeyin.dart';
import 'package:deyin/my_buttondeyin.dart';
import 'package:deyin/my_text_filed_deyin.dart';
import 'package:deyin/signup_scrndeyin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app_constantsdeyin.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  signIn(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:  Text('Aucun utilisateur trouvé pour cet e-mail.'),
        ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: AppBar().preferredSize.height * 2),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Image.asset(
                AppConstants.appLogo,
                width: fullWidth(context) * 0.22,
              ),
            ),
            SizedBox(height: fullHeight(context) * 0.06),
            const Text(
              'Bienvenue de retour',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Connectez-vous à votre compte Minifurs",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),),
            SizedBox(height: fullHeight(context) * 0.04, ),
            MyTextFiled(hint: 'Enter Adresse Email', textEditingController: email,),
            SizedBox(height: fullHeight(context) * 0.02),
            MyTextFiled(hint: 'Mot de Passe', hasIcon: true, textEditingController: password,),
            SizedBox(height: fullHeight(context) * 0.01),
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: const Text("Mot de passe oblier?",
                     style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),),)),
            SizedBox(height: fullHeight(context) * 0.04),
            MyButton(onPressed: () {
              print("********");
              print(email.text);
              print(password.text);

              signIn(email.text,password.text, context);
            }, title: 'Se connecter'),
            SizedBox(height: fullHeight(context) * 0.03),
            
          ],
        ),
        
      ),
    );
  }
}
