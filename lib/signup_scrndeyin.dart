import 'package:deyin/configdeyin.dart';
import 'package:deyin/home_scrndeyin.dart';
import 'package:deyin/my_buttondeyin.dart';
import 'package:deyin/my_text_filed_deyin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'app_constantsdeyin.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController name= TextEditingController();
  TextEditingController Email= TextEditingController();
  TextEditingController Password= TextEditingController();
  signUp(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:  Text("Email déjà utilisé, veuillez utiliser l'auteur emil"),
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
              'Créer un Compte',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Enter vos informations"),
            SizedBox(height: fullHeight(context) * 0.04),
            MyTextFiled(hint: 'Nom et prénom',textEditingController: name,),
            SizedBox(height: fullHeight(context) * 0.02),
            MyTextFiled(hint: 'Adresse Email', textEditingController: Email,),
            SizedBox(height: fullHeight(context) * 0.02),
            MyTextFiled(hint: 'Mot de Passe', hasIcon: true, textEditingController: Password,),
            SizedBox(height: fullHeight(context) * 0.01),
    
            SizedBox(height: fullHeight(context) * 0.04),
            MyButton(onPressed: () {
               print("********");
              print(Email.text);
              print(Password.text);

              signUp(Email.text,Password.text, context);
            }, title: 'Crée un Compte'),
            SizedBox(height: fullHeight(context) * 0.03),
            
          ],
        ),
      ),
    );
  }
}
