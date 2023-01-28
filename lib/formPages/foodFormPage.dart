import 'form_functions.dart';
import 'package:flutter/material.dart';
import '../utils/settings.dart';

class FoodFormPage extends StatefulWidget {
  const FoodFormPage({Key? key}) : super(key: key);

  @override
  State<FoodFormPage> createState() => _FoodFormPageState();
}

class _FoodFormPageState extends State<FoodFormPage> {
  DateTime dateSelected = today;

  newDateSelectedCallBack(DateTime daySelected) {
    setState(() {
      dateSelected = daySelected;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: foodPageAppBarColor,
        title: const Text("Insert a new food!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: foodForm(dateSelected,context, newDateSelectedCallBack),
      ),
    );
  }
}

//TODO: Insert a foodform with defaultDay today, and a calendar picker for the datetime.
//TODO: The ID will be picked automatically
Form foodForm(DateTime dateSelected, BuildContext context, dayPickedCallBack) {
  GlobalKey<FormState> foodFormKey = GlobalKey<FormState>();
  TextEditingController foodController = TextEditingController();


  return Form(
    key: foodFormKey,
    child: Column(
      children: [
        foodField(foodController),
        Align(
            alignment: Alignment.centerLeft,
            child: dateSelectorWidget(dateSelected, dayPickedCallBack, context)),
      ],
    ),
  );

}
