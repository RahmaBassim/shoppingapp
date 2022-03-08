import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class DrawerAtho extends StatefulWidget {
  const DrawerAtho({Key? key}) : super(key: key);

  @override
  _DrawerAthoState createState() => _DrawerAthoState();
}

class _DrawerAthoState extends State<DrawerAtho> {
  TextEditingController Email=TextEditingController();
  TextEditingController Password=TextEditingController();
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth= FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        print ("No user Found for this Email");
      }
    }
    return user;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
            width: 240,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(41, 111, 113, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
                onTap: (){
                  showDialog(context: context, builder: (context)=>SimpleDialog(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 300,
                        height: 100,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter your Email",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: Colors.black,),
                            border: OutlineInputBorder(),
                          ),
                          controller: Email,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 300,
                        height: 100,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your Password",
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock,color: Colors.black,),
                            border: OutlineInputBorder(),
                          ),
                          controller: Password,
                        ),
                      ),
                      TextButton(onPressed: ()async{
                        User? user =await loginUsingEmailPassword(
                            email: Email.text,
                            password: Password.text,
                            context: context);
                        print (user);
                        if (user !=null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AddData()));
                        }
                      },
                          child:Text("LogIn",
                            style: TextStyle(fontSize: 30,color: Color.fromRGBO(41, 111, 113, 1)),))
                    ],
                  ));
                },
                child: Center(child: Text("Admin", style: TextStyle(color: Colors.white, fontSize: 40),)))
        ),
      ),
    );
  }
}
