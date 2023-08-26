import 'package:bmi_calculator/components/reuseablecard.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String bmi;
  final String result;
  final String feedback;
  const ResultScreen({
    super.key,
    required this.bmi,
    required this.result,
    required this.feedback,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              'Result',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ReuseableCard(
            color: const Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.result,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25,
                  ),
                ),
                Text(
                  widget.bmi,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    widget.feedback,
                    style: const TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
            onpress: () {},
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
            ),
            child: const Text(
              'RE-CALCULATE',
            ),
          ),
        ],
      ),
    );
  }
}
