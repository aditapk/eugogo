import 'package:eugogo/mild_modulate_go_screen.dart';
import 'package:eugogo/result_of_estimation_go.dart';
import 'package:eugogo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/my_checkbox.dart';

class SeverityOfGOScreen extends StatefulWidget {
  const SeverityOfGOScreen({super.key});

  @override
  State<SeverityOfGOScreen> createState() => _SeverityOfGOScreenState();
}

class _SeverityOfGOScreenState extends State<SeverityOfGOScreen> {
  double widthHeader = 120;
  TextStyle defaultTextStyle = const TextStyle(fontSize: 18);

  // VA text controller
  TextEditingController vARtController = TextEditingController();
  TextEditingController vALtController = TextEditingController();

  // VA drop - YES, NO
  bool vADropYesState = false;
  bool vADropNoState = false;

  // Color - Rt. Normal, Abnormal
  bool colorRtNormalState = false;
  bool colorRtAbnormalState = false;
  // Color - Lt. Normal, Abnormal
  bool colorLtNormalState = false;
  bool colorLtAbnormalState = false;

  // Optic nerve - Rt. edema YES, NO
  bool opticNerveRtEdemaYesState = false;
  bool opticNerveRtEdemaNoState = false;
  // Optic nerve - Lt. edema YES, NO
  bool opticNerveLtEdemaYesState = false;
  bool opticNerveLtEdemaNoState = false;
  // Optic nerve - Rt. pale YES, NO
  bool opticNerveRtPaleYesState = false;
  bool opticNerveRtPaleNoState = false;
  // Optic nerve - Lt. pale YES, NO
  bool opticNerveLtPaleYesState = false;
  bool opticNerveLtPaleNoState = false;

  // Cornea - YES, NO
  bool corneaYesState = false;
  bool corneaNoState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("การประเมินผู้ป่วย 1"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            TextButton(
              child: const Text("Next"),
              onPressed: () {
                // check Sight threatening of Grave's Orbitopathy (GO)
                // 1 - yes or 1 - abnormal is sight threatening
                List<bool> yesStateList = [
                  vADropYesState,
                  opticNerveRtEdemaYesState,
                  opticNerveLtEdemaYesState,
                  opticNerveRtPaleYesState,
                  opticNerveLtPaleYesState,
                  corneaYesState,
                ];
                List<bool> abnormalStateList = [
                  colorRtAbnormalState,
                  colorLtAbnormalState,
                ];
                // checking severity of GO
                if (yesStateList.any((state) => state) ||
                    abnormalStateList.any((state) => state)) {
                  // Go to severity page
                  Get.to(() => const ResultOfEstimationGO(
                      estimated: 'Sight-threatening-GO'));
                  //print("Sight Threatening");
                } else {
                  // Go to check next page
                  Get.to(() => const MildModulateGOScreen());
                  //print('Next Page');
                }
              },
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            bool isVertical = height > width;
            return isVertical
                ? SizedBox(
                    width: width,
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sight threatening of Grave's Orbitopathy (GO)",
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: DividedSection(
                              text: "VA",
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: MyTextField(
                                title: 'Rt',
                                controller: vARtController,
                              )),
                              Expanded(
                                  child: MyTextField(
                                title: "Lt",
                                controller: vALtController,
                              )),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'VA drop ลงหรือไม่',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyCheckbox(
                                            text: "YES",
                                            value: vADropYesState,
                                            onChanged: (state) {
                                              if (state!) {
                                                // set YES state and clear NO state
                                                setState(() {
                                                  vADropYesState = state;
                                                  vADropNoState = !state;
                                                });
                                              } else {
                                                // clear YES state only
                                                setState(() {
                                                  vADropYesState = state;
                                                });
                                              }
                                            }),
                                      ),
                                      Expanded(
                                        child: MyCheckbox(
                                          text: "NO",
                                          value: vADropNoState,
                                          onChanged: (state) {
                                            if (state!) {
                                              // set NO state and clear YES state
                                              setState(() {
                                                vADropNoState = state;
                                                vADropYesState = !state;
                                              });
                                            } else {
                                              // clear NO state only
                                              setState(() {
                                                vADropNoState = state;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                            child: DividedSection(
                              text: "Color",
                            ),
                          ),
                          // Rt - Normal, AbNormal
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                const Text(
                                  "Rt.",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                    value: colorRtNormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        setState(() {
                                          // set normal state and clear abnormal state
                                          colorRtNormalState =
                                              state; // normal state
                                          colorRtAbnormalState =
                                              !state; // abnormal state
                                        });
                                      } else {
                                        setState(() {
                                          // clear normal state only
                                          colorRtNormalState = state;
                                        });
                                      }
                                    },
                                    text: "Normal",
                                  ),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                    value: colorRtAbnormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        setState(() {
                                          // set abnormal state and clear normal state
                                          colorRtAbnormalState =
                                              state; // normal state
                                          colorRtNormalState =
                                              !state; // abnormal state
                                        });
                                      } else {
                                        setState(() {
                                          // clear abnormal state only
                                          colorRtAbnormalState = state;
                                        });
                                      }
                                    },
                                    text: "Abnormal",
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Lt.",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                    value: colorLtNormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        // set Lt Normal state and clear Lt Abnormal state
                                        setState(() {
                                          colorLtNormalState = state;
                                          colorLtAbnormalState = !state;
                                        });
                                      } else {
                                        // clear Lt Normal state only
                                        setState(() {
                                          colorLtNormalState = state;
                                        });
                                      }
                                    },
                                    text: "Normal",
                                  ),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                    value: colorLtAbnormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        // set Lt Abnormal state and clear Lt Normal state
                                        setState(() {
                                          colorLtAbnormalState = state;
                                          colorLtNormalState = !state;
                                        });
                                      } else {
                                        // clear Lt Abnormal only
                                        setState(() {
                                          colorLtAbnormalState = state;
                                        });
                                      }
                                    },
                                    text: "Abnormal",
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Optic - nerve
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                            child: DividedSection(
                              text: "Optic nerve",
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 90,
                                  child: Text(
                                    'Rt. edema',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "YES",
                                      value: opticNerveRtEdemaYesState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Rt. edema Yes state and clear Rt. edema No state
                                          setState(() {
                                            opticNerveRtEdemaYesState = state;
                                            opticNerveRtEdemaNoState = !state;
                                          });
                                        } else {
                                          // clear Rt. edema Yes state
                                          setState(() {
                                            opticNerveRtEdemaYesState = state;
                                          });
                                        }
                                      }),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "NO",
                                      value: opticNerveRtEdemaNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Rt. edema No state and clear Rt. edema Yes state
                                          setState(() {
                                            opticNerveRtEdemaNoState = state;
                                            opticNerveRtEdemaYesState = !state;
                                          });
                                        } else {
                                          // clear Rt. edema No state only
                                          setState(() {
                                            opticNerveRtEdemaNoState = state;
                                          });
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 90,
                                  child: Text(
                                    'Lt. edema',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "YES",
                                      value: opticNerveLtEdemaYesState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt. edema Yes state and clear Lt. edema No state
                                          setState(() {
                                            opticNerveLtEdemaYesState = state;
                                            opticNerveLtEdemaNoState = !state;
                                          });
                                        } else {
                                          // clear Lt. edema Yes state only
                                          setState(() {
                                            opticNerveLtEdemaYesState = state;
                                          });
                                        }
                                      }),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "NO",
                                      value: opticNerveLtEdemaNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt. edema No state and clear Lt. edema Yes state
                                          setState(() {
                                            opticNerveLtEdemaNoState = state;
                                            opticNerveLtEdemaYesState = !state;
                                          });
                                        } else {
                                          // clear Lt. edema No state only
                                          setState(() {
                                            opticNerveLtEdemaNoState = state;
                                          });
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 10),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 90,
                                  child: Text(
                                    'Rt. pale',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "YES",
                                      value: opticNerveRtPaleYesState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Rt. pale Yes state and clear Rt. pale No state
                                          setState(() {
                                            opticNerveRtPaleYesState = state;
                                            opticNerveRtPaleNoState = !state;
                                          });
                                        } else {
                                          // clear Rt. pale Yes state only
                                          setState(() {
                                            opticNerveRtPaleYesState = state;
                                          });
                                        }
                                      }),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "NO",
                                      value: opticNerveRtPaleNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Rt. pale No state and clear Rt. pale Yes state
                                          setState(() {
                                            opticNerveRtPaleNoState = state;
                                            opticNerveRtPaleYesState = !state;
                                          });
                                        } else {
                                          // clear Rt. pale No state only
                                          setState(() {
                                            opticNerveRtPaleNoState = state;
                                          });
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 90,
                                  child: Text(
                                    'Lt. pale',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "YES",
                                      value: opticNerveLtPaleYesState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt. pale Yes state and clear Lt. pale No state
                                          setState(() {
                                            opticNerveLtPaleYesState = state;
                                            opticNerveLtPaleNoState = !state;
                                          });
                                        } else {
                                          // clear Lt. pale Yes state only
                                          setState(() {
                                            opticNerveLtPaleYesState = state;
                                          });
                                        }
                                      }),
                                ),
                                Expanded(
                                  child: MyCheckbox(
                                      text: "No",
                                      value: opticNerveLtPaleNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt. pale No state and clear Lt. pale Yes state
                                          setState(() {
                                            opticNerveLtPaleNoState = state;
                                            opticNerveLtPaleYesState = !state;
                                          });
                                        } else {
                                          // clear Lt. pale No state only
                                          setState(() {
                                            opticNerveLtPaleNoState = state;
                                          });
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          // Conea
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                            child: DividedSection(
                              text: "Coneas",
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8.0, right: 8.0, top: 5),
                            child: Text(
                              'พบว่ามี exposure keratitis หรือ corneal abrasion หรือ corneal ulcev จากภาวะไทรอยด์ขึ้นตา',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 10),
                            child: Row(
                              children: [
                                MyCheckbox(
                                    text: "YES",
                                    value: corneaYesState,
                                    onChanged: (state) {
                                      if (state!) {
                                        // set cornea Yes state and clear cornea No state
                                        setState(() {
                                          corneaYesState = state;
                                          corneaNoState = !state;
                                        });
                                      } else {
                                        // clear cornea Yes state only
                                        setState(() {
                                          corneaYesState = state;
                                        });
                                      }
                                    }),
                                const SizedBox(
                                  width: 40,
                                ),
                                MyCheckbox(
                                    text: "NO",
                                    value: corneaNoState,
                                    onChanged: (state) {
                                      if (state!) {
                                        // set cornea No state and clear cornea Yes state
                                        setState(() {
                                          corneaNoState = state;
                                          corneaYesState = !state;
                                        });
                                      } else {
                                        // clear cornea No state
                                        setState(() {
                                          corneaNoState = state;
                                        });
                                      }
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                // horizontal
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sight threatening of Grave's Orbitopathy (GO)",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // VA section
                          Row(
                            children: [
                              SizedBox(
                                width: widthHeader,
                                child: const Text(
                                  "VA",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: MyTextField(
                                title: 'Rt',
                                controller: vARtController,
                              )),
                              Expanded(
                                  child: MyTextField(
                                title: "Lt",
                                controller: vALtController,
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: widthHeader + 8,
                              ),
                              const Text(
                                'VA drop ลงหรือไม่',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    MyCheckbox(
                                        text: "YES",
                                        value: vADropYesState,
                                        onChanged: (state) {
                                          if (state!) {
                                            // set YES state and clear NO state
                                            setState(() {
                                              vADropYesState = state;
                                              vADropNoState = !state;
                                            });
                                          } else {
                                            // clear YES state only
                                            setState(() {
                                              vADropYesState = state;
                                            });
                                          }
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyCheckbox(
                                      text: "NO",
                                      value: vADropNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set NO state and clear YES state
                                          setState(() {
                                            vADropNoState = state;
                                            vADropYesState = !state;
                                          });
                                        } else {
                                          // clear NO state only
                                          setState(() {
                                            vADropNoState = state;
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Color - section
                          Row(
                            children: [
                              SizedBox(
                                width: widthHeader,
                                child: const Text(
                                  "Color",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  const Text(
                                    "Rt.",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MyCheckbox(
                                    value: colorRtNormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        setState(() {
                                          // set normal state and clear abnormal state
                                          colorRtNormalState =
                                              state; // normal state
                                          colorRtAbnormalState =
                                              !state; // abnormal state
                                        });
                                      } else {
                                        setState(() {
                                          // clear normal state only
                                          colorRtNormalState = state;
                                        });
                                      }
                                    },
                                    text: "Normal",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MyCheckbox(
                                    value: colorRtAbnormalState,
                                    onChanged: (state) {
                                      if (state!) {
                                        setState(() {
                                          // set abnormal state and clear normal state
                                          colorRtAbnormalState =
                                              state; // normal state
                                          colorRtNormalState =
                                              !state; // abnormal state
                                        });
                                      } else {
                                        setState(() {
                                          // clear abnormal state only
                                          colorRtAbnormalState = state;
                                        });
                                      }
                                    },
                                    text: "Abnormal",
                                  )
                                ],
                              )),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Lt.",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyCheckbox(
                                      value: colorLtNormalState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt Normal state and clear Lt Abnormal state
                                          setState(() {
                                            colorLtNormalState = state;
                                            colorLtAbnormalState = !state;
                                          });
                                        } else {
                                          // clear Lt Normal state only
                                          setState(() {
                                            colorLtNormalState = state;
                                          });
                                        }
                                      },
                                      text: "Normal",
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyCheckbox(
                                      value: colorLtAbnormalState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set Lt Abnormal state and clear Lt Normal state
                                          setState(() {
                                            colorLtAbnormalState = state;
                                            colorLtNormalState = !state;
                                          });
                                        } else {
                                          // clear Lt Abnormal only
                                          setState(() {
                                            colorLtAbnormalState = state;
                                          });
                                        }
                                      },
                                      text: "Abnormal",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Optic nerve - section
                          Row(
                            children: [
                              const SizedBox(
                                width: 120,
                                child: Text(
                                  "Optic nerve",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 90,
                                            child: Text(
                                              'Rt. edema',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          MyCheckbox(
                                              text: "YES",
                                              value: opticNerveRtEdemaYesState,
                                              onChanged: (state) {
                                                if (state!) {
                                                  // set Rt. edema Yes state and clear Rt. edema No state
                                                  setState(() {
                                                    opticNerveRtEdemaYesState =
                                                        state;
                                                    opticNerveRtEdemaNoState =
                                                        !state;
                                                  });
                                                } else {
                                                  // clear Rt. edema Yes state
                                                  setState(() {
                                                    opticNerveRtEdemaYesState =
                                                        state;
                                                  });
                                                }
                                              }),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MyCheckbox(
                                              text: "NO",
                                              value: opticNerveRtEdemaNoState,
                                              onChanged: (state) {
                                                if (state!) {
                                                  // set Rt. edema No state and clear Rt. edema Yes state
                                                  setState(() {
                                                    opticNerveRtEdemaNoState =
                                                        state;
                                                    opticNerveRtEdemaYesState =
                                                        !state;
                                                  });
                                                } else {
                                                  // clear Rt. edema No state only
                                                  setState(() {
                                                    opticNerveRtEdemaNoState =
                                                        state;
                                                  });
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 90,
                                            child: Text(
                                              'Lt. edema',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          MyCheckbox(
                                              text: "YES",
                                              value: opticNerveLtEdemaYesState,
                                              onChanged: (state) {
                                                if (state!) {
                                                  // set Lt. edema Yes state and clear Lt. edema No state
                                                  setState(() {
                                                    opticNerveLtEdemaYesState =
                                                        state;
                                                    opticNerveLtEdemaNoState =
                                                        !state;
                                                  });
                                                } else {
                                                  // clear Lt. edema Yes state only
                                                  setState(() {
                                                    opticNerveLtEdemaYesState =
                                                        state;
                                                  });
                                                }
                                              }),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MyCheckbox(
                                              text: "NO",
                                              value: opticNerveLtEdemaNoState,
                                              onChanged: (state) {
                                                if (state!) {
                                                  // set Lt. edema No state and clear Lt. edema Yes state
                                                  setState(() {
                                                    opticNerveLtEdemaNoState =
                                                        state;
                                                    opticNerveLtEdemaYesState =
                                                        !state;
                                                  });
                                                } else {
                                                  // clear Lt. edema No state only
                                                  setState(() {
                                                    opticNerveLtEdemaNoState =
                                                        state;
                                                  });
                                                }
                                              }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 128,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Rt. pale',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        MyCheckbox(
                                            text: "YES",
                                            value: opticNerveRtPaleYesState,
                                            onChanged: (state) {
                                              if (state!) {
                                                // set Rt. pale Yes state and clear Rt. pale No state
                                                setState(() {
                                                  opticNerveRtPaleYesState =
                                                      state;
                                                  opticNerveRtPaleNoState =
                                                      !state;
                                                });
                                              } else {
                                                // clear Rt. pale Yes state only
                                                setState(() {
                                                  opticNerveRtPaleYesState =
                                                      state;
                                                });
                                              }
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyCheckbox(
                                            text: "NO",
                                            value: opticNerveRtPaleNoState,
                                            onChanged: (state) {
                                              if (state!) {
                                                // set Rt. pale No state and clear Rt. pale Yes state
                                                setState(() {
                                                  opticNerveRtPaleNoState =
                                                      state;
                                                  opticNerveRtPaleYesState =
                                                      !state;
                                                });
                                              } else {
                                                // clear Rt. pale No state only
                                                setState(() {
                                                  opticNerveRtPaleNoState =
                                                      state;
                                                });
                                              }
                                            }),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Lt. pale',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        MyCheckbox(
                                            text: "YES",
                                            value: opticNerveLtPaleYesState,
                                            onChanged: (state) {
                                              if (state!) {
                                                // set Lt. pale Yes state and clear Lt. pale No state
                                                setState(() {
                                                  opticNerveLtPaleYesState =
                                                      state;
                                                  opticNerveLtPaleNoState =
                                                      !state;
                                                });
                                              } else {
                                                // clear Lt. pale Yes state only
                                                setState(() {
                                                  opticNerveLtPaleYesState =
                                                      state;
                                                });
                                              }
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyCheckbox(
                                            text: "No",
                                            value: opticNerveLtPaleNoState,
                                            onChanged: (state) {
                                              if (state!) {
                                                // set Lt. pale No state and clear Lt. pale Yes state
                                                setState(() {
                                                  opticNerveLtPaleNoState =
                                                      state;
                                                  opticNerveLtPaleYesState =
                                                      !state;
                                                });
                                              } else {
                                                // clear Lt. pale No state only
                                                setState(() {
                                                  opticNerveLtPaleNoState =
                                                      state;
                                                });
                                              }
                                            }),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Cornea - section
                          Row(
                            children: [
                              SizedBox(
                                width: widthHeader,
                                child: const Text(
                                  "Cornea",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'พบว่ามี exposure keratitis หรือ corneal abrasion หรือ corneal ulcev จากภาวะไทรอยด์ขึ้นตา',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: widthHeader,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  MyCheckbox(
                                      text: "YES",
                                      value: corneaYesState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set cornea Yes state and clear cornea No state
                                          setState(() {
                                            corneaYesState = state;
                                            corneaNoState = !state;
                                          });
                                        } else {
                                          // clear cornea Yes state only
                                          setState(() {
                                            corneaYesState = state;
                                          });
                                        }
                                      }),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  MyCheckbox(
                                      text: "NO",
                                      value: corneaNoState,
                                      onChanged: (state) {
                                        if (state!) {
                                          // set cornea No state and clear cornea Yes state
                                          setState(() {
                                            corneaNoState = state;
                                            corneaYesState = !state;
                                          });
                                        } else {
                                          // clear cornea No state
                                          setState(() {
                                            corneaNoState = state;
                                          });
                                        }
                                      }),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}

class DividedSection extends StatelessWidget {
  const DividedSection({
    super.key,
    this.text,
  });

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(text ?? "untitle",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
