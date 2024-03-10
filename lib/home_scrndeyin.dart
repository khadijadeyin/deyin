import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deyin/app_constantsdeyin.dart';
import 'package:deyin/configdeyin.dart';
import 'package:deyin/first_scrndeyin.dart';
import 'package:deyin/product_scrndeyin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get con$t => null;
  
  get leading => null;
  GlobalKey<FormState> key=GlobalKey();
  CollectionReference _reference=FirebaseFirestore.instance.collection('sopping_liste');
String imageUrl='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text("Home", 
        style: TextStyle(color: Colors.black, 
        fontSize: 30.0,
         fontWeight: FontWeight.bold),),
         actions: [
          Icon(
            Icons.notifications,
          )
         ],
         iconTheme: IconThemeData(color: Colors.black, size: 30.0)
         ),
         
         drawer: Drawer(
          child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
              ],
              ),
              ),
              ),
         
      body:
      
      Center(
        child:Form(
          
          child:Column(children: [  
          Text(" Selectionner une photo",
          style: TextStyle(color: Colors.red,
          fontWeight: FontWeight.bold,
            fontSize: fontSize10(context) * 1.0), ),
        IconButton(onPressed:()async{
          ImagePicker imagePicker=ImagePicker();
          XFile? file= await imagePicker.pickImage(source: ImageSource.camera);
          print('$file?.path');
          if(File==null) return;
          String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();

          //get a referance to storage root
          Reference referenceRoot=FirebaseStorage.instance.ref();
          Reference referenceDirImages= referenceRoot.child('images');
          //create a reference for the image tobe stored
          Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);
          //erreur Sucess
          try{
          //store the file
          await referenceImageToUpload.putFile(File(file!.path));
          // sucess: get the download URL
          imageUrl= await referenceImageToUpload.getDownloadURL();

          }catch(erreur){//somme erreur
          }
        }, icon: Icon(Icons.camera_alt)),
        ElevatedButton(onPressed: () {}, child: Text("Submit")),
       Text(" pour aller vers Liste de blogs disponibles cliqué sur drawr",style: TextStyle(
            fontSize: fontSize10(context) * 1.5),
      ),
       Align(
              alignment: AlignmentDirectional.topStart,
              child: Image.asset('assets/images/logo.png'),
             
),
            
      ],)
      ),
      
    ));

   
  }
  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
     ),
     child: Column(children: [
      CircleAvatar(
        radius:60, backgroundImage: NetworkImage('assets/images/khd.png'
          )
     
     ,),
     SizedBox(height: 12),
     Text("Khadija Deyin", style: TextStyle(fontSize: 25.0, 
     color: Colors.black)),
     Text('khadijadeyin@gmail.com',style: TextStyle(fontSize: 25.0, 
     color: Colors.black)),
     ]
     ));
  
  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text("Home"),
        onTap: () {
          Navigator.pop(context);

            Navigator.of(context).pushReplacement (MaterialPageRoute(
               builder: (context) => const HomeScreen(),
              ),
              );
        },
      ),

      ListTile( 
        leading: Icon(Icons.favorite_border),
        title: const Text("les Blogs"),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const 
          productScreen(),
          ),);},),
          
   
      ListTile( 
        leading: Icon(Icons.power_settings_new),
        title: const Text("Déconnexion"),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  
          FirstScreen(),
          ),);},),
          ListTile( 
        leading: Icon(Icons.phone),
        title: const Text("contacte sur l'aimail un hots ou 36527868 "),
        onLongPress: () {

        },),

        ListTile( leading:  IconButton(
          icon: Icon(Icons.language),
          
            onPressed: () {
                child: Text('Changer la Langue');
            
            
            },),),
          ]
   
  );
}
