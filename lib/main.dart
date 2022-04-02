import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norwegian_cruise_lines/constants.dart';
import 'package:norwegian_cruise_lines/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Norwegian Cruise Lines',
      theme: ThemeData(
          primarySwatch: kPrimaryColor,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const HomeScreen(),
    );
  }
}
