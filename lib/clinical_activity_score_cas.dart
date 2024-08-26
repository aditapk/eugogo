import 'package:eugogo/models/patient_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_of_moderate_to_severe_go.dart';

class ClinicalActivityScoreScreen extends StatefulWidget {
  const ClinicalActivityScoreScreen({super.key});

  @override
  State<ClinicalActivityScoreScreen> createState() =>
      _ClinicalActivityScoreScreenState();
}

class _ClinicalActivityScoreScreenState
    extends State<ClinicalActivityScoreScreen> {
  bool firstEstimate = true;
  Color selectedColor = Colors.purple.shade100;

  // first
  List<bool> firstEstimateChoices = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> againEstimateChoices = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final PatientProfileModel patientStateController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clinical Activity Score (CAS)"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            TextButton(
                onPressed: () {
                  // Estimating condition
                  // >= 3/7 => Active, >= 4/10 => Active
                  // otherwise, Inactive

                  if (firstEstimate) {
                    int nSelected =
                        firstEstimateChoices.where((element) => element).length;
                    if (nSelected >= 3) {
                      // update state
                      patientStateController.lastEstimate =
                          "Modulate-to-Severe-GO-active";

                      Get.to(
                        () => const ResultOfModerateToSevereGO(
                          activeState: true,
                        ),
                      );
                    } else {
                      // update state
                      patientStateController.lastEstimate =
                          "Modulate-to-Severe-GO-inactive";

                      Get.to(
                        () => const ResultOfModerateToSevereGO(
                          activeState: false,
                        ),
                      );
                    }
                  } else {
                    int nSelected =
                        againEstimateChoices.where((element) => element).length;
                    if (nSelected >= 4) {
                      // update state
                      patientStateController.lastEstimate =
                          "Modulate-to-Severe-GO-active";
                      Get.to(
                        () => const ResultOfModerateToSevereGO(
                          activeState: true,
                        ),
                      );
                    } else {
                      // update state
                      patientStateController.lastEstimate =
                          "Modulate-to-Severe-GO-inactive";
                      Get.to(
                        () => const ResultOfModerateToSevereGO(
                          activeState: false,
                        ),
                      );
                    }
                  }
                },
                child: const Text("Next"))
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            bool isVertical = height > width;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: isVertical
                  ? Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade400, width: 2.0),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          firstEstimate ? selectedColor : null,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: 40,
                                    child: const Text('ประเมินครั้งแรก'),
                                  ),
                                  const Divider(
                                    thickness: 2.0,
                                    height: 0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CheckItem(
                                            text:
                                                '1. Spontaneous retrobulbaw pain',
                                            value: firstEstimateChoices[0],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[0] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '2. Pain on upward or downword gaze',
                                            value: firstEstimateChoices[1],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[1] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '3. Redness of eyelids',
                                            value: firstEstimateChoices[2],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[2] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '4. Redness of conjunctive',
                                            value: firstEstimateChoices[3],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[3] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '5. Swelling of caruncle or plicy',
                                            value: firstEstimateChoices[4],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[4] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '6. Swelling of eyelids',
                                            value: firstEstimateChoices[5],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[5] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '7. Swelling of conjunctive (Chemosis)',
                                            value: firstEstimateChoices[6],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[6] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  firstEstimate = true;
                                  againEstimateChoices = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                });
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 2.0,
                            height: 0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          firstEstimate ? null : selectedColor,
                                    ),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 40,
                                    child: const Text('ประเมินซ้ำใน 1-3 เดือน'),
                                  ),
                                  const Divider(
                                    thickness: 2.0,
                                    height: 0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CheckItem(
                                            text:
                                                '1. Spontaneous retrobulbaw pain',
                                            value: againEstimateChoices[0],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[0] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '2. Pain on upward or downword gaze',
                                            value: againEstimateChoices[1],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[1] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '3. Redness of eyelids',
                                            value: againEstimateChoices[2],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[2] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '4. Redness of conjunctive',
                                            value: againEstimateChoices[3],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[3] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '5. Swelling of caruncle or plicy',
                                            value: againEstimateChoices[4],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[4] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '6. Swelling of eyelids',
                                            value: againEstimateChoices[5],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[5] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '7. Swelling of conjunctive (Chemosis)',
                                            value: againEstimateChoices[6],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[6] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '8. increase in exophthalmos \u2265 2 mm',
                                            value: againEstimateChoices[7],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[7] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '9. decrease in eye motility \u2265 8 \u0366',
                                            value: againEstimateChoices[8],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[8] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '10. decrease in visual activity in 1-3 month',
                                            value: againEstimateChoices[9],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[9] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  firstEstimate = false;
                                  firstEstimateChoices = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade400, width: 2.0),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          firstEstimate ? selectedColor : null,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: 40,
                                    child: const Text('ประเมินครั้งแรก'),
                                  ),
                                  const Divider(
                                    thickness: 2.0,
                                    height: 0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CheckItem(
                                            text:
                                                '1. Spontaneous retrobulbaw pain',
                                            value: firstEstimateChoices[0],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[0] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '2. Pain on upward or downword gaze',
                                            value: firstEstimateChoices[1],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[1] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '3. Redness of eyelids',
                                            value: firstEstimateChoices[2],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[2] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '4. Redness of conjunctive',
                                            value: firstEstimateChoices[3],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[3] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '5. Swelling of caruncle or plicy',
                                            value: firstEstimateChoices[4],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[4] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '6. Swelling of eyelids',
                                            value: firstEstimateChoices[5],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[5] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '7. Swelling of conjunctive (Chemosis)',
                                            value: firstEstimateChoices[6],
                                            onCheck: (value) {
                                              if (firstEstimate) {
                                                setState(() {
                                                  firstEstimateChoices[6] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  firstEstimate = true;
                                  againEstimateChoices = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                });
                              },
                            ),
                          ),
                          const VerticalDivider(
                            width: 2,
                            thickness: 2.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          firstEstimate ? null : selectedColor,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 40,
                                    child: const Text('ประเมินซ้ำใน 1-3 เดือน'),
                                  ),
                                  const Divider(
                                    thickness: 2.0,
                                    height: 0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CheckItem(
                                            text:
                                                '1. Spontaneous retrobulbaw pain',
                                            value: againEstimateChoices[0],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[0] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '2. Pain on upward or downword gaze',
                                            value: againEstimateChoices[1],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[1] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '3. Redness of eyelids',
                                            value: againEstimateChoices[2],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[2] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '4. Redness of conjunctive',
                                            value: againEstimateChoices[3],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[3] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '5. Swelling of caruncle or plicy',
                                            value: againEstimateChoices[4],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[4] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text: '6. Swelling of eyelids',
                                            value: againEstimateChoices[5],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[5] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '7. Swelling of conjunctive (Chemosis)',
                                            value: againEstimateChoices[6],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[6] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '8. increase in exophthalmos \u2265 2 mm',
                                            value: againEstimateChoices[7],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[7] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '9. decrease in eye motility \u2265 8 \u0366',
                                            value: againEstimateChoices[8],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[8] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                          CheckItem(
                                            text:
                                                '10. decrease in visual activity in 1-3 month',
                                            value: againEstimateChoices[9],
                                            onCheck: (value) {
                                              if (!firstEstimate) {
                                                setState(() {
                                                  againEstimateChoices[9] =
                                                      value!;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  firstEstimate = false;
                                  firstEstimateChoices = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ));
  }
}

class CheckItem extends StatelessWidget {
  const CheckItem({
    super.key,
    this.text,
    this.value,
    this.onCheck,
  });

  final String? text;
  final bool? value;
  final Function(bool?)? onCheck;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Checkbox(value: value, onChanged: onCheck),
        const SizedBox(
          width: 8,
        ),
        Text(text ?? 'untitle'),
      ],
    );
  }
}
