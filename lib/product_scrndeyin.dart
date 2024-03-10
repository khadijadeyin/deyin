import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deyin/ebou_oubeida.dart';
import 'package:deyin/home_scrndeyin.dart';
import 'package:flutter/material.dart';

class productScreen extends StatefulWidget {
  const productScreen({super.key});

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  List product = [];
  bool isloading = true;
  _productItem(product) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: ListTile(
          leading: const Icon(Icons.photo_rounded),
          title: Text(product['name'],
          
              style: TextStyle(fontWeight: FontWeight.w900)),
          trailing: RichText(
              text: TextSpan(
                  text: product['auteur'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
              )),
           
          ),
    );
  }

  Future<void> getProductFromFirebase() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection("products").get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();
        print(data);
        product.add(data);
      }
      isloading = false;
      setState(() {});
    } catch (error) {
      print('---------------------------------');
      print('Error fetching hotels: $error');
      isloading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getProductFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
       
           title: InkWell( child: Text("Liste des Blogs"),
              onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const 
          HomeScreen(),
          ),);}, 
          
      ),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                 return ListTile(
              title: Text('Ebou Oubeida $index'),
              subtitle: Text('Auteur: Khadija Deyin'),
              leading: Tab(
                icon: Tab(icon: Image.asset("assets/images/logo.png")),
                
              ),
               onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const 
          EbouOubeida (),
          ),);},
              );
              
              },

            ),
            
            
    );
  }

}