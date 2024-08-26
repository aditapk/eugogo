import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_of_radioiodine_estimation.dart';

class RiskFactorsForProgression extends StatefulWidget {
  const RiskFactorsForProgression({
    super.key,
    required this.goState,
  });

  final String goState;
  @override
  State<RiskFactorsForProgression> createState() =>
      _RiskFactorsForProgressionState();
}

class _RiskFactorsForProgressionState extends State<RiskFactorsForProgression> {
  bool smokingState = false;
  bool severOrUnstableState = false;
  bool highSerumTSHRAbState = false;
  bool noneOfAllabove = false;

  List<String> severeOfGOList = [
    "No GO",
    "Mild GO",
    "Sight-Threatening GO",
    "Moderate to Severe GO,\ninactive",
    "Moderate to Severe GO,\nactive"
  ];

  List<String> riskFactorList = [
    "Smoking",
    "Severe or unstable hyperthyroidism",
    "High serum TSHR - Ab",
    "none of all above"
  ];
  List<bool> riskFactorStateList = [
    false,
    false,
    false,
    false,
  ];

  clearOtherState() {
    riskFactorStateList[0] = false;
    riskFactorStateList[1] = false;
    riskFactorStateList[2] = false;
  }

  List<String> treatmentList = [
    "สามารถกลืนแร่ได้เลยโดยไม่ต้องให้ steriod prophylaxis",
    "สามารถกลืนแร่ได้ โดยสามารถให้ low dose steriod prophylaxis คือ prednisolone 0.2-0.3 mg/kg/day taper off in 4-6 weeks, start ยาในวันที่กลืนแร่",
    "สามารถกลืนแร่ได้ โดยให้ standard steroid prophylaxis คือ prednisolone 0.4-0.5 mg/kg/day taper off in 3 months, start ยาในวันที่กลืนแร่",
    //"ยังไม่ควรกลืนแร่ในขณะนี้",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Risk factors for progression"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          TextButton(
              onPressed: () {
                if (widget.goState == severeOfGOList[0] &&
                    riskFactorStateList[3] == true) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[0],
                      ));
                } else if (widget.goState == severeOfGOList[0] &&
                    riskFactorStateList[3] == false) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[1],
                      ));
                } else if (widget.goState == severeOfGOList[1] &&
                    riskFactorStateList[3] == true) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[1],
                      ));
                } else if (widget.goState == severeOfGOList[3] &&
                    riskFactorStateList[3] == true) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[1],
                      ));
                } else if (widget.goState == severeOfGOList[1] &&
                    riskFactorStateList[3] == false) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[2],
                      ));
                } else if (widget.goState == severeOfGOList[3] &&
                    riskFactorStateList[3] == false) {
                  Get.to(() => ResultOfRadioiodineEstimation(
                        text: treatmentList[2],
                      ));
                }
                // else if (widget.goState == severeOfGOList[4]) {
                //   Get.to(() => ResultOfRadioiodineEstimation(
                //         text: treatmentList[3],
                //       ));
                // } else if (widget.goState == severeOfGOList[2]) {
                //   Get.to(() => ResultOfRadioiodineEstimation(
                //         text: treatmentList[3],
                //       ));
                // }
              },
              child: const Text("Next"))
        ],
      ),
      body: Column(
        children: riskFactorList.map((e) {
          int index = riskFactorList.indexOf(e);
          return CheckboxListTile(
            value: riskFactorStateList[index],
            onChanged: (state) {
              if (index != 3) {
                setState(() {
                  riskFactorStateList[index] = state!;

                  if (state) {
                    riskFactorStateList[3] = false;
                  }
                });
              } else {
                setState(() {
                  riskFactorStateList[index] = state!;
                  clearOtherState();
                });
              }
            },
            title: Text(e),
          );
        }).toList(),
      ),
    );
  }
}
