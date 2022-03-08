import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:statefire/view/Home.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner: false,
      )
  );
}


class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cover()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(23, 42, 75, 1),
      child: Image(
        image: AssetImage("assets/icons/cealogo.PNG"),
      ),
    );
  }
}

class Cover extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}
