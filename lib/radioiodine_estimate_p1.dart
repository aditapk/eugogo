import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'radioiodine_estimate_p2.dart';

class RadioiodineEstimatePage1 extends StatefulWidget {
  const RadioiodineEstimatePage1({super.key});

  @override
  State<RadioiodineEstimatePage1> createState() =>
      _RadioiodineEstimatePage1State();
}

class _RadioiodineEstimatePage1State extends State<RadioiodineEstimatePage1> {
  String goSelected = "";
  List<String> severeOfGOList = [
    "No GO",
    "Mild GO",
    "Sight-Threatening GO",
    "Moderate to Severe GO,\ninactive",
    "Moderate to Severe GO,\nactive"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Severity of Grave's Ophthalmopathy"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          TextButton(
              onPressed: () {
                if (goSelected.isNotEmpty) {
                  Get.to(
                    () => RiskFactorsForProgression(
                      goState: goSelected,
                    ),
                  );
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
              ? SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    children: severeOfGOList.map((e) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: MyCard(
                          height: (height - (20 * 5) - 20) / 5,
                          text: e,
                          isSelected: goSelected == e,
                          onSelected: () {
                            setState(() {
                              goSelected = e;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                )
              : SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCard(
                            height: (height - 20 - 10) / 2,
                            width: (width - (20 * 2) - 10) / 3,
                            text: severeOfGOList[0],
                            isSelected: goSelected == severeOfGOList[0],
                            onSelected: () {
                              setState(() {
                                goSelected = severeOfGOList[0];
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyCard(
                            height: (height - 20 - 10) / 2,
                            width: (width - (20 * 2) - 10) / 3,
                            text: severeOfGOList[1],
                            isSelected: goSelected == severeOfGOList[1],
                            onSelected: () {
                              setState(() {
                                goSelected = severeOfGOList[1];
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyCard(
                            height: (height - 20 - 10) / 2,
                            width: (width - (20 * 2) - 10) / 3,
                            text: severeOfGOList[2],
                            isSelected: goSelected == severeOfGOList[2],
                            onSelected: () {
                              setState(() {
                                goSelected = severeOfGOList[2];
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCard(
                            height: (height - 20 - 10) / 2,
                            width: (width - 20 - 10) / 2,
                            text: severeOfGOList[3],
                            isSelected: goSelected == severeOfGOList[3],
                            onSelected: () {
                              setState(() {
                                goSelected = severeOfGOList[3];
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyCard(
                            height: (height - 20 - 10) / 2,
                            width: (width - 20 - 20) / 2,
                            text: severeOfGOList[4],
                            isSelected: goSelected == severeOfGOList[4],
                            onSelected: () {
                              setState(() {
                                goSelected = severeOfGOList[4];
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    this.text,
    this.isSelected,
    this.onSelected,
    this.width,
    this.height,
  });
  final String? text;
  final bool? isSelected;
  final Function()? onSelected;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          color: isSelected ?? false ? Colors.yellow.shade100 : null,
          child: Center(
              child: Text(
            text ?? 'untitle',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          )),
        ),
      ),
    );
  }
}
