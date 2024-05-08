import 'package:flutter/material.dart';
import '../constants.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LocalColors.primary,
        title: const Text(
            'Javier Chauvin - Resume',
          style: TextStyle(color: LocalColors.background)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Resume',
            ),
            Text(
              style: Theme.of(context).textTheme.headlineMedium,
              'Javier Chauvin'
            ),
          ],
        ),
      ),
    );
  }
}