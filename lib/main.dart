import 'package:flutter/material.dart';
import 'package:flutter_application_6/const/colors.dart';
import 'package:flutter_application_6/screen/home_page.dart';
import 'package:flutter_application_6/screen/patient_Infomation_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screen/summary_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primary,
        textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: PatientInfomation(onAddData: (MyUserData ) {  },),
    );
  }
}
