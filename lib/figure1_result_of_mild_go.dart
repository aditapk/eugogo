import 'package:eugogo/choose_estimation_topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultOfMildGO extends StatefulWidget {
  const ResultOfMildGO({super.key});

  @override
  State<ResultOfMildGO> createState() => _ResultOfMildGOState();
}

class _ResultOfMildGOState extends State<ResultOfMildGO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Management Algorithm (Figure 1)'),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(()=>const ChooseEstimationTopic(), routeName: 'choose-estimation-topic');
              },
              child: const Text("Next"))
        ],
      ),
      body: Center(
        child: Image.asset('images/mildgo.jpg'),
      ),
      backgroundColor: Colors.white,
    );
  }
}
