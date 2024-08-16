import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_estimation_topic.dart';
import 'widgets/my_checkbox.dart';
import 'widgets/my_text_field.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key, required this.title});
  final String title;

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  TextEditingController hnController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  TextEditingController orbitopathySymptomController = TextEditingController();
  TextEditingController orbitopathyTreatmentController =
      TextEditingController();
  TextEditingController thyroidSymptomController = TextEditingController();
  bool thyroidSergeryFlag = false;
  bool takeMineralFlag = false;
  bool takeMedicineFlag = false;

  bool noSmokingFlag = false;
  bool smokingFlag = false;
  TextEditingController rateOfSmoking = TextEditingController();
  TextEditingController timeOfSmoking = TextEditingController();
  bool someOneSmokingFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton(
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Get.to(() => const ChooseEstimationTopic());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyTextField(
                title: "HN",
                controller: hnController,
              ),
              Row(
                children: [
                  Expanded(
                      child: MyTextField(
                    title: "ชื่อ",
                    controller: nameController,
                  )),
                  Expanded(
                    child: MyTextField(
                      title: "นามสกุล",
                      controller: surnameController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MyTextField(
                    title: "อายุ",
                    controller: ageController,
                  )),
                  Expanded(
                    child: MyTextField(
                      title: "เพศ",
                      controller: genderController,
                    ),
                  ),
                  Expanded(
                    child: MyTextField(
                      title: "เชื้อชาติ",
                      controller: nationalityController,
                    ),
                  ),
                ],
              ),
              // section - Orbitopathy
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Orbitopathy",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              MyTextField(
                title: "อาการ",
                controller: orbitopathySymptomController,
              ),
              MyTextField(
                title: "การรักษาที่ได้รับ",
                controller: orbitopathyTreatmentController,
              ),
              // section - Thyroid
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Thyroid",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              MyTextField(
                title: "อาการ",
                controller: thyroidSymptomController,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    Text(
                      "การรักษาที่ได้รับ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyCheckbox(
                      text: "ผ่าตัดไทรอยด์",
                      value: thyroidSergeryFlag,
                      onChanged: (check) {
                        setState(() {
                          thyroidSergeryFlag = check!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: MyCheckbox(
                      text: "กลืนแร่",
                      value: takeMineralFlag,
                      onChanged: (check) {
                        setState(() {
                          takeMineralFlag = check!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: MyCheckbox(
                      text: "รับประทานยา",
                      value: takeMedicineFlag,
                      onChanged: (check) {
                        setState(() {
                          takeMedicineFlag = check!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              // if (takeMedicineFlag)
              // waiting for confirm
              // Row(
              //   children: [
              //     Expanded(
              //       child: MyTextField(
              //         title: "ชื่อยา",
              //       ),
              //     ),
              //     Expanded(
              //       child: MyTextField(
              //         title: "ขนาด",
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Smoking",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              MyCheckbox(
                text: "ไม่สูบและไม่มีบุคคลในบ้านสูบ",
                value: noSmokingFlag,
                onChanged: (check) {
                  setState(() {
                    noSmokingFlag = check!;
                  });
                },
              ),
              Row(
                children: [
                  MyCheckbox(
                    text: "สูบ",
                    value: smokingFlag,
                    onChanged: (check) {
                      setState(() {
                        smokingFlag = check!;
                      });
                    },
                  ),
                  Expanded(
                    child: MyTextField(
                      title: "จำนวน (มวน/วัน)",
                      controller: rateOfSmoking,
                      enabled: smokingFlag,
                    ),
                  ),
                  Expanded(
                    child: MyTextField(
                      title: "มานาน (ปี)",
                      controller: timeOfSmoking,
                      enabled: smokingFlag,
                    ),
                  ),
                ],
              ),
              MyCheckbox(
                text: "ไม่สูบและบุคคลในบ้านสูบ",
                value: someOneSmokingFlag,
                onChanged: (check) {
                  setState(() {
                    someOneSmokingFlag = check!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        //print("บันทึกข้อมูล");
                        Get.to(() => const ChooseEstimationTopic());
                      },
                      child: const Text('บันทึกข้อมูล')))
            ],
          ),
        ),
      ),
    );
  }
}
