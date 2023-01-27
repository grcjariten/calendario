import 'package:flutter/material.dart';
import '../utils/settings.dart';

class FoodFormPage extends StatelessWidget {
  const FoodFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: foodPageAppBarColor,
        title: const Text("Insert a new food!"),
      ),
    );
  }
}
