import 'package:eugogo/choose_estimation_topic.dart';
import 'package:eugogo/figure1_result_of_mild_go.dart';
import 'package:eugogo/figure4_result_of_sight_threatening_go.dart';
import 'package:eugogo/models/patient_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clinical_activity_score_cas.dart';

class ResultOfEstimationGO extends StatefulWidget {
  const ResultOfEstimationGO({
    super.key,
    required this.estimated,
  });

  final String estimated;

  @override
  State<ResultOfEstimationGO> createState() => _ResultOfEstimationGOState();
}

class _ResultOfEstimationGOState extends State<ResultOfEstimationGO> {
  Map<String, String> results = {
    "No-GO": "No GO",
    "Mild-GO": "Mild GO",
    "Modulate-to-Severe-GO": "Modulate to Severe GO",
    "Sight-threatening-GO": "Sight threatening GO"
  };
  List<String> goStateList = [
    "No GO",
    "Mild GO",
    "Modulate to Severe GO",
    "Sight threatening GO",
  ];
  final PatientProfileModel patientStateController = Get.find();

  @override
  void initState() {
    super.initState();
    // update last estimation
    patientStateController.lastEstimate = widget.estimated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการประเมิน Severity of GO"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: widget.estimated == "No-GO"
            ? [
                TextButton(
                    onPressed: () {
                      Get.to(const ChooseEstimationTopic());
                    },
                    child: const Text("Next"))
              ]
            : null,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;
        bool isVisible = height > width;
        return isVisible
            ? SizedBox(
                width: width,
                height: height,
                child: Column(
                  children: [
                    Text(
                      'ผลประเมิน คือ \n ${results[widget.estimated]}',
                      style: const TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height - 116,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GOTypeButton(
                            height: (height - 116 - (10 * 5)) / 4,
                            width: width * 0.9,
                            text: "No GO",
                            selected: "No-GO" == widget.estimated,
                            onPressed: "No-GO" == widget.estimated
                                ? () {
                                    //print("No GO -> to ...");
                                  }
                                : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GOTypeButton(
                            height: (height - 116 - (10 * 5)) / 4,
                            width: width * 0.9,
                            text: "Mild GO",
                            selected: "Mild-GO" == widget.estimated,
                            onPressed: "Mild-GO" == widget.estimated
                                ? () {
                                    //print("Management Algorithm (Figure 1)");
                                    Get.to(() => const ResultOfMildGO());
                                  }
                                : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GOTypeButton(
                            height: (height - 116 - (10 * 5)) / 4,
                            width: width * 0.9,
                            text: "Modulate to Severe GO",
                            selected:
                                "Modulate-to-Severe-GO" == widget.estimated,
                            onPressed:
                                "Modulate-to-Severe-GO" == widget.estimated
                                    ? () {
                                        //print('ประเมิน CAS Score');
                                        Get.to(() =>
                                            const ClinicalActivityScoreScreen());
                                      }
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GOTypeButton(
                            height: (height - 116 - (10 * 5)) / 4,
                            width: width * 0.9,
                            text: "Sight - threatening GO",
                            selected:
                                "Sight-threatening-GO" == widget.estimated,
                            onPressed:
                                "Sight-threatening-GO" == widget.estimated
                                    ? () {
                                        //print('Managment Algorithm (Figure 4)');
                                        Get.to(() =>
                                            const ResultOfSightThreatenningGO());
                                      }
                                    : null,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              )
            : SizedBox(
                width: width,
                height: height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'ผลประเมิน คือ ${results[widget.estimated]}',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.9,
                        height: height - 64,
                        child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 3,
                            children: [
                              GOTypeButton(
                                text: "No GO",
                                selected: "No-GO" == widget.estimated,
                                onPressed: "No-GO" == widget.estimated
                                    ? () {
                                        //print("No GO -> to ...");
                                      }
                                    : null,
                              ),
                              GOTypeButton(
                                text: "Mild GO",
                                selected: "Mild-GO" == widget.estimated,
                                onPressed: "Mild-GO" == widget.estimated
                                    ? () {
                                        //print("Management Algorithm (Figure 1)");
                                        Get.to(() => const ResultOfMildGO());
                                      }
                                    : null,
                              ),
                              GOTypeButton(
                                text: "Modulate to Severe GO",
                                selected:
                                    "Modulate-to-Severe-GO" == widget.estimated,
                                onPressed:
                                    "Modulate-to-Severe-GO" == widget.estimated
                                        ? () {
                                            //print('ประเมิน CAS Score');
                                            Get.to(() =>
                                                const ClinicalActivityScoreScreen());
                                          }
                                        : null,
                              ),
                              GOTypeButton(
                                text: "Sight - threatening GO",
                                selected:
                                    "Sight-threatening-GO" == widget.estimated,
                                onPressed:
                                    "Sight-threatening-GO" == widget.estimated
                                        ? () {
                                            //print('Managment Algorithm (Figure 4)');
                                            Get.to(() =>
                                                const ResultOfSightThreatenningGO());
                                          }
                                        : null,
                              ),
                            ])),
                  ],
                ),
              );
      }),
    );
  }
}

class GOTypeButton extends StatelessWidget {
  const GOTypeButton({
    super.key,
    this.text,
    required this.selected,
    this.onPressed,
    this.width,
    this.height,
  });
  final String? text;
  final bool selected;
  final Function()? onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: selected ? Colors.yellow.shade300 : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: onPressed,
            child: Text(
              text ?? "untitle",
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )));
  }
}
