import 'dart:js';

import 'package:deyin/firebase_options.dart';
import 'package:deyin/first_scrndeyin.dart';
import 'package:deyin/login_scrndeyin.dart';
import 'package:deyin/product_scrndeyin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';




void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home:FirstScreen());
    
  }

}
