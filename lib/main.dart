import 'package:flutter/material.dart';
import 'package:quizzy/screens/HomeScreen.dart';
import 'screens/splashScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/profileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/Add a Question.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Quizzy());
}



class Quizzy extends StatefulWidget {
  const Quizzy({Key? key}) : super(key: key);

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'splashScreen':(context)=>SplashScreen(),
          'home':(context)=>HomeScreen(),
          'login':(context)=>Login(),
          'register':(context)=>SignUp(),
          'profile':(context)=>Profile(),
          'addQuestion':(context)=>AddQuestion()
        },
      );
    }
    else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splashScreen',
        routes: {
          'splashScreen':(context)=>SplashScreen(),
          'home':(context)=>HomeScreen(),
          'login':(context)=>Login(),
          'register':(context)=>SignUp(),
          'profile':(context)=>Profile(),
          'addQuestion':(context)=>AddQuestion()
        },
      );
    }
  }
}
