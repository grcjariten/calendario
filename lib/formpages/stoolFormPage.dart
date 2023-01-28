import 'package:flutter/material.dart';
import 'package:calendario/utils/settings.dart';

class StoolFormPage extends StatelessWidget {
  const StoolFormPage({Key? key, required this.dateSelected}) : super(key: key);
  final DateTime dateSelected;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: stoolPageAppBarColor,
        title: const Text("Insert a new stool!"),
      ),
    );
  }
}