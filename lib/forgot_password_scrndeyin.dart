import 'package:deyin/configdeyin.dart';
import 'package:deyin/my_buttondeyin.dart';
import 'package:deyin/my_text_filed_deyin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_constantsdeyin.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController mytextEditingController=TextEditingController();
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
              'Reinitialiser le Mot de passe',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Saisissez votre Adresse Email pour reinitialisez votre mot de passe ",
             style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold)),
            SizedBox(height: fullHeight(context) * 0.04),
            MyTextFiled(hint: 'Entrer Addresse Email ',textEditingController:mytextEditingController),
            SizedBox(height: fullHeight(context) * 0.04),
            MyButton(onPressed: () {}, title: 'Envoyer le lien '),
            SizedBox(height: fullHeight(context) * 0.03),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Vous avez déjà un compte? ",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Retour a la connexion',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
