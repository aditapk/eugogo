import 'package:eugogo/choose_estimation_topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultOfSightThreatenningGO extends StatefulWidget {
  const ResultOfSightThreatenningGO({super.key});

  @override
  State<ResultOfSightThreatenningGO> createState() =>
      _ResultOfSightThreatenningGOState();
}

class _ResultOfSightThreatenningGOState
    extends State<ResultOfSightThreatenningGO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Managment Algorithm (Figure 4)'),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(()=>const ChooseEstimationTopic(), routeName: 'choose-estimation-topic');
              },
              child: const Text("Next"))
        ],
      ),
      body: Center(
        child: Image.asset('images/signt_threatening_go.jpg'),
      ),
    );
  }
}
