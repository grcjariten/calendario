import 'package:calendario/ui/functions.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: foodForm(context),
      ),
    );
  }
}

//TODO: Insert a foodform with defaultDay today, and a calendar picker for the datetime.
//TODO: The ID will be picked automatically
Form foodForm(BuildContext context) {
  GlobalKey<FormState> foodFormKey = GlobalKey<FormState>();
  DateTime dateSelected = today;
  TextEditingController foodController = TextEditingController();


  return Form(
    key: foodFormKey,
    child: Column(
      children: [
        foodField(foodController),
        Align(
            alignment: Alignment.centerLeft,
            child: datePickerButton(dateSelected, context)),
      ],
    ),
  );

}
