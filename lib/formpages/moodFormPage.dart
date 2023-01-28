import 'package:flutter/material.dart';
import 'package:calendario/utils/settings.dart';

class MoodFormPage extends StatelessWidget {
  const MoodFormPage({Key? key, required this.dateSelected}) : super(key: key);
  final DateTime dateSelected;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodPageAppBarColor,
        title: const Text("Insert a new mood"),
      ),
    );
  }
}