import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:statefire/Firebase/show.dart';

class AddData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController Code= TextEditingController();
    TextEditingController DescriptionEnglish= TextEditingController();
    TextEditingController DescriptionArabic= TextEditingController();
    TextEditingController Price= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add To Firebase"),
        backgroundColor: Color.fromRGBO(155, 81, 104, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Code",
                  labelText: "code",
                  border: OutlineInputBorder(),
                ),
                controller: Code,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Description in English",
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                controller: DescriptionEnglish,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Description in Arabic",
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                controller: DescriptionArabic,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              height: 100,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Price",
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                controller: Price,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () async{
                        await FirebaseFirestore.instance.collection("Products").doc().set({
                          "Code": Code.text,
                          "DescriptionEnglish": DescriptionEnglish.text,
                          "DescriptionArabic": DescriptionArabic.text,
                          "Price": Price.text,
                        });
                      },
                      child: Icon(Icons.add,size: 40,),
                    ),
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
