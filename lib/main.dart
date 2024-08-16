import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Grave's Ophthalmopathy Evaluation & Management",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // ResultOfEstimationGO(
          //   estimated: "No-GO",
          // ),
          //MildModulateGOScreen(),
          // SeverityOfGOScreen(),
          //const PatientProfileScreen(title: 'ข้อมูลผู้ป่วย'),
          const UserLoginScreen(),
      //const SeverityOfGOScreen(),
      //const MildModulateGOScreen(),
      //const ClinicalActivityScoreScreen(),
      //const ChooseEstimationTopic(),
      //SeverityOfGOScreen(),
      //const RadioiodineEstimatePage1(),

      //const ResultOfRadioiodineEstimation(),
      //const RadioiodineEstimatePage1(),

      //ClinicalActivityScoreScreen(),
      //ResultOfMildGO(),
      //ResultOfSightThreatenningGO(),
    );
  }
}
