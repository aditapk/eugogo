import 'package:eugogo/result_of_estimation_go.dart';
import 'package:eugogo/widgets/my_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MildModulateGOScreen extends StatefulWidget {
  const MildModulateGOScreen({super.key});

  @override
  State<MildModulateGOScreen> createState() => _MildModulateGOScreenState();
}

class _MildModulateGOScreenState extends State<MildModulateGOScreen> {
  double headerFontSize = 20;
  double headerSpace = 280;

  // Lid retraction < 2mm, >= 2mm
  bool lidRetractionLess2mm = false;
  bool lidRetractionMeq2mm = false;

  // soft tissue involvement mild, modulate to servere
  bool softTissueInvolvementMild = false;
  bool softTissueInvolvementMod2Servere = false;

  // expothalmos < 3mm, >= 3mm
  bool expothlmosLess3mm = false;
  bool expothlmosMeq3mm = false;

  // diplopia no or intermittent, inconstant or constant
  bool diplopiaNoOrIntermittent = false;
  bool diplopiaInconstantOrConstant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('การประเมินผู้ป่วย 2'),
          actions: [
            TextButton(
                onPressed: () {
                  List<bool> rightItemList = [
                    lidRetractionMeq2mm,
                    softTissueInvolvementMod2Servere,
                    expothlmosMeq3mm,
                    diplopiaInconstantOrConstant,
                  ];
                  List<bool> allItemList = [
                    lidRetractionLess2mm,
                    lidRetractionMeq2mm,
                    softTissueInvolvementMild,
                    softTissueInvolvementMod2Servere,
                    expothlmosLess3mm,
                    expothlmosMeq3mm,
                    diplopiaNoOrIntermittent,
                    diplopiaInconstantOrConstant,
                  ];

                  int nSelected =
                      rightItemList.where((element) => element).length;

                  if (nSelected >= 2) {
                    Get.to(() => const ResultOfEstimationGO(
                        estimated: "Modulate-to-Severe-GO"));
                  } else {
                    if (allItemList.any(
                      (element) => element,
                    )) {
                      Get.to(() =>
                          const ResultOfEstimationGO(estimated: "Mild-GO"));
                    } else {
                      Get.to(
                          () => const ResultOfEstimationGO(estimated: "No-GO"));
                    }
                  }
                },
                child: const Text('Next'))
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;

            bool isVertical = height > width;
            return isVertical
                ? Container(
                    width: width,
                    height: height,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'เลือกประเมินหรือไม่ก็ได้',
                          style: TextStyle(fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Lid retraction',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MyCheckbox(
                                text: "< 2 mm",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: lidRetractionLess2mm,
                                onChanged: (state) {
                                  if (state!) {
                                    // set < 2mm state and clear >= 2mm state
                                    setState(() {
                                      lidRetractionLess2mm = state;
                                      lidRetractionMeq2mm = !state;
                                    });
                                  } else {
                                    // clear < 2mm state only
                                    setState(() {
                                      lidRetractionLess2mm = state;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: MyCheckbox(
                                text: "\u2265 2 mm", // >=
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: lidRetractionMeq2mm,
                                onChanged: (state) {
                                  if (state!) {
                                    // set >= 2mm state and clear < 2mm state
                                    setState(() {
                                      lidRetractionMeq2mm = state;
                                      lidRetractionLess2mm = !state;
                                    });
                                  } else {
                                    // clear >= 2mm state
                                    setState(() {
                                      lidRetractionMeq2mm = state;
                                    });
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Soft tissue involvement',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MyCheckbox(
                                text: "mild",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: softTissueInvolvementMild,
                                onChanged: (state) {
                                  if (state!) {
                                    // set mild state and clear modulate to servere state
                                    setState(() {
                                      softTissueInvolvementMild = state;
                                      softTissueInvolvementMod2Servere = !state;
                                    });
                                  } else {
                                    // clear mild state only
                                    setState(() {
                                      softTissueInvolvementMild = state;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: MyCheckbox(
                                text: "modulate to servere",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: softTissueInvolvementMod2Servere,
                                onChanged: (state) {
                                  if (state!) {
                                    // set modulate to servere state and clear mild state
                                    setState(() {
                                      softTissueInvolvementMod2Servere = state;
                                      softTissueInvolvementMild = !state;
                                    });
                                  } else {
                                    // clear modulate to servere state only
                                    setState(() {
                                      softTissueInvolvementMod2Servere = state;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Expothalmos (เมื่อเปรียบเทียบกับ เชื้อชาติและเพศเดียวกัน)',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MyCheckbox(
                                text: "< 3mm",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: expothlmosLess3mm,
                                onChanged: (state) {
                                  if (state!) {
                                    // set < 3mm state and clear >= 3mm state
                                    setState(() {
                                      expothlmosLess3mm = state;
                                      expothlmosMeq3mm = !state;
                                    });
                                  } else {
                                    // clear < 3mm state only
                                    setState(() {
                                      expothlmosLess3mm = state;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: MyCheckbox(
                                text: "\u2265 3mm", // >=
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: expothlmosMeq3mm,
                                onChanged: (state) {
                                  if (state!) {
                                    // set >= 3mm state and clear < 3mm state
                                    setState(() {
                                      expothlmosMeq3mm = state;
                                      expothlmosLess3mm = !state;
                                    });
                                  } else {
                                    // clear >= 3mm state only
                                    setState(() {
                                      expothlmosMeq3mm = state;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                          child: Text(
                            'Diplopia',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MyCheckbox(
                                text: "no or \nintermittent",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: diplopiaNoOrIntermittent,
                                onChanged: (state) {
                                  if (state!) {
                                    // set no or intermittent state and clear inconstant or constant state
                                    setState(() {
                                      diplopiaNoOrIntermittent = state;
                                      diplopiaInconstantOrConstant = !state;
                                    });
                                  } else {
                                    // clear no or intermittent state only
                                    setState(() {
                                      diplopiaNoOrIntermittent = state;
                                    });
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: MyCheckbox(
                                text: "inconstant or \nconstant",
                                textStyle: const TextStyle(fontSize: 18),
                                space: 5,
                                value: diplopiaInconstantOrConstant,
                                onChanged: (state) {
                                  if (state!) {
                                    // set inconstant or constant state and clear no or intermittent
                                    setState(() {
                                      diplopiaInconstantOrConstant = state;
                                      diplopiaNoOrIntermittent = !state;
                                    });
                                  } else {
                                    // clear incontant or constant state only
                                    setState(() {
                                      diplopiaInconstantOrConstant = state;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'เลือกประเมินหรือไม่ก็ได้',
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: headerSpace,
                                child: Text(
                                  'Lid retraction',
                                  style: TextStyle(
                                      fontSize: headerFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "< 2 mm",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: lidRetractionLess2mm,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set < 2mm state and clear >= 2mm state
                                      setState(() {
                                        lidRetractionLess2mm = state;
                                        lidRetractionMeq2mm = !state;
                                      });
                                    } else {
                                      // clear < 2mm state only
                                      setState(() {
                                        lidRetractionLess2mm = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "\u2265 2 mm", // >=
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: lidRetractionMeq2mm,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set >= 2mm state and clear < 2mm state
                                      setState(() {
                                        lidRetractionMeq2mm = state;
                                        lidRetractionLess2mm = !state;
                                      });
                                    } else {
                                      // clear >= 2mm state
                                      setState(() {
                                        lidRetractionMeq2mm = state;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: headerSpace,
                                child: Text(
                                  'Soft tissue involvement',
                                  style: TextStyle(
                                      fontSize: headerFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "mild",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: softTissueInvolvementMild,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set mild state and clear modulate to servere state
                                      setState(() {
                                        softTissueInvolvementMild = state;
                                        softTissueInvolvementMod2Servere =
                                            !state;
                                      });
                                    } else {
                                      // clear mild state only
                                      setState(() {
                                        softTissueInvolvementMild = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "modulate to servere",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: softTissueInvolvementMod2Servere,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set modulate to servere state and clear mild state
                                      setState(() {
                                        softTissueInvolvementMod2Servere =
                                            state;
                                        softTissueInvolvementMild = !state;
                                      });
                                    } else {
                                      // clear modulate to servere state only
                                      setState(() {
                                        softTissueInvolvementMod2Servere =
                                            state;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: headerSpace,
                                child: Text(
                                  'Expothalmos \n(เมื่อเปรียบเทียบกับ เชื้อชาติและเพศเดียวกัน)',
                                  style: TextStyle(
                                      fontSize: headerFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "< 3mm",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: expothlmosLess3mm,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set < 3mm state and clear >= 3mm state
                                      setState(() {
                                        expothlmosLess3mm = state;
                                        expothlmosMeq3mm = !state;
                                      });
                                    } else {
                                      // clear < 3mm state only
                                      setState(() {
                                        expothlmosLess3mm = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "\u2265 3mm", // >=
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: expothlmosMeq3mm,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set >= 3mm state and clear < 3mm state
                                      setState(() {
                                        expothlmosMeq3mm = state;
                                        expothlmosLess3mm = !state;
                                      });
                                    } else {
                                      // clear >= 3mm state only
                                      setState(() {
                                        expothlmosMeq3mm = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: headerSpace,
                                child: Text(
                                  'Diplopia',
                                  style: TextStyle(
                                      fontSize: headerFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "no or intermittent",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: diplopiaNoOrIntermittent,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set no or intermittent state and clear inconstant or constant state
                                      setState(() {
                                        diplopiaNoOrIntermittent = state;
                                        diplopiaInconstantOrConstant = !state;
                                      });
                                    } else {
                                      // clear no or intermittent state only
                                      setState(() {
                                        diplopiaNoOrIntermittent = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: MyCheckbox(
                                  text: "inconstant or constant",
                                  textStyle: const TextStyle(fontSize: 18),
                                  space: 5,
                                  value: diplopiaInconstantOrConstant,
                                  onChanged: (state) {
                                    if (state!) {
                                      // set inconstant or constant state and clear no or intermittent
                                      setState(() {
                                        diplopiaInconstantOrConstant = state;
                                        diplopiaNoOrIntermittent = !state;
                                      });
                                    } else {
                                      // clear incontant or constant state only
                                      setState(() {
                                        diplopiaInconstantOrConstant = state;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
