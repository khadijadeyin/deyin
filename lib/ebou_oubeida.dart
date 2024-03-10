import 'package:deyin/app_constantsdeyin.dart';
import 'package:deyin/configdeyin.dart';
import 'package:flutter/material.dart';

class EbouOubeida extends StatelessWidget {
  const EbouOubeida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell( child: Text("Ebou Obeida"),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const 
          EbouOubeida (),)
          );
          }
          )),
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
                width: fullWidth(context) * 1.22,
              ),
            ),
            SizedBox(height: fullHeight(context) * 0.06),
            const Text(
              "Abou Obeida, voix du bras armé du Hamas et nouvelle “icône” des Palestiniens. Grâce à ses apparitions médiatiques, le porte-parole des Brigades Al-Qassams est imposé comme un des visages de la guerre à Gaza qui affiche jusque dans la Nation Misilmane",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
  ]),

    ));
  }
}