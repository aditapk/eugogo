import 'package:eugogo/choose_estimation_topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultOfModerateToSevereGO extends StatelessWidget {
  const ResultOfModerateToSevereGO({
    super.key,
    required this.activeState,
  });

  final bool activeState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: activeState
            ? const Text("Moderate to Severe GO with Active GO")
            : const Text("Moderate to Severe GO with Inactive GO"),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(()=>const ChooseEstimationTopic(), routeName: 'choose-estimation-topic');
              },
              child: const Text("Next"))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("images/moderate_to_severe_and_active_go_1.jpg"),
              if (activeState)
                const SizedBox(
                  height: 10,
                ),
              if (activeState)
                Image.asset("images/moderate_to_severe_and_active_go_2.jpg")
            ],
          ),
        ),
      ),
    );
  }
}
