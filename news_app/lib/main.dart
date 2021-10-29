import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: SplashScreen(),
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
        bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
      )),
    );
  }
}
