import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/patient_profile_model.dart';
import 'patient_profile_screen.dart';

void main() {
  Get.put(PatientProfileModel());
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
      home: const PatientProfileScreen(title: 'ข้อมูลผู้ป่วย'), // no login page
    );
  }
}
