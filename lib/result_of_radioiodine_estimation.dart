import 'package:flutter/material.dart';

class ResultOfRadioiodineEstimation extends StatelessWidget {
  const ResultOfRadioiodineEstimation({
    super.key,
    this.text,
  });

  final String? text;

  final String referenceText = """References
  1. 	Bartalena L, Kahaly GJ, Baldeschi L, Dayan CM, Eckstein A, Marcocci C, et al. The 2021 European Group on Graves’ orbitopathy (EUGOGO) 
      clinical practice guidelines for the medical management of Graves’ orbitopathy. Eur J Endocrinol. 2021 Oct 1;185(4):G43–67.
  2. 	Shiber S, Stiebel-Kalish H, Shimon I, Grossman A, Robenshtok E. Glucocorticoid regimens for prevention of Graves’ ophthalmopathy progression 
      following radioiodine treatment: systematic review and meta-analysis. Thyroid Off J Am Thyroid Assoc. 2014 Oct;24(10):1515–23.
""";

  layOutBox(double width) {
    if (width > 600) {
      return width * 0.8;
    } else {
      return width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โดย management ที่ควรจะเป็นคือ"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  text ?? "untitle",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: Center(child: Text(referenceText))),
        ],
      ),
    );
  }
}
