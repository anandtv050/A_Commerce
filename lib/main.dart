import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  //const LandingPage({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (Context,snapshot) {
        //IF snapshot has error
        if(snapshot.hasError){
          return  Scaffold(
            body:Center(
              child: Text("Error:${snapshot.error}"),
            )
          );
        }
       if (snapshot.connectionState ==ConnectionState.done){
         return Scaffold(
             body:Container(
                 child:Center(
                     child:Text("Firebase App initialized")
                 )
             )
         );
       }
       return Scaffold(
         body: Center(
           child: Text("Initialization App..."),
         ),
       );
      },
    );
  }
}
