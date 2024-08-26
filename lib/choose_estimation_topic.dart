import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'radioiodine_estimate_p1.dart';
import 'severity_of_go_screen.dart';

class ChooseEstimationTopic extends StatefulWidget {
  const ChooseEstimationTopic({super.key});

  @override
  State<ChooseEstimationTopic> createState() => _ChooseEstimationTopicState();
}

class _ChooseEstimationTopicState extends State<ChooseEstimationTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ท่านต้องการประเมินในหัวข้อ"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            bool isVertical = height > width;

            return isVertical
                ? Center(
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: width * 0.05,
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 20, bottom: 20),
                        //   child: Text(
                        //     "<ข้อความที่ 1>",
                        //     style: TextStyle(fontSize: 30),
                        //   ),
                        // ),
                        MyButton(
                          width: width * 0.9,
                          height: height * 0.25,
                          text:
                              "Severity of Grave's Ophthalmopathy and Management Guideline",
                          fontSize: 24,
                          onPressed: () {
                            Get.to(() => const SeverityOfGOScreen());
                          },
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        MyButton(
                          width: width * 0.9,
                          height: height * 0.25,
                          text:
                              "Glucocorticoid Regimens for Prevention of Grave's Ophthalmopathy Progresssion Following Radioiodine Treatment",
                          fontSize: 24,
                          onPressed: () {
                            Get.to(() => const RadioiodineEstimatePage1());
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: width,
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 20, bottom: 20),
                        //   child: Text(
                        //     "<ข้อความที่ 1>",
                        //     style: TextStyle(fontSize: 30),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              width: (width * 0.8) / 2,
                              height: height / 2,
                              text:
                                  "Severity of Grave's Ophthalmopathy and Management Guideline",
                              fontSize: 20,
                              onPressed: () {
                                Get.to(() => const SeverityOfGOScreen());
                              },
                            ),
                            SizedBox(
                              width: width * 0.025,
                            ),
                            MyButton(
                              width: (width * 0.8) / 2,
                              height: height * 0.5,
                              text:
                                  "Glucocorticoid Regimens for Prevention of Grave's Ophthalmopathy Progresssion Following Radioiodine Treatment",
                              fontSize: 20,
                              onPressed: () {
                                Get.to(() => const RadioiodineEstimatePage1());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.width,
    this.height,
  });
  final String text;
  final double? fontSize;
  final Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 40,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
