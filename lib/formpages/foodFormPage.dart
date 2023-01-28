import 'package:calendario/utils/database_helper.dart';
import 'package:intl/intl.dart';
import '../form_ui/form_widgets.dart';
import 'package:flutter/material.dart';
import '../utils/settings.dart';

class FoodFormPage extends StatefulWidget {
  const FoodFormPage({Key? key, required this.dateSelected}) : super(key: key);
  final DateTime dateSelected;



  @override
  State<FoodFormPage> createState() => _FoodFormPageState();
}

class _FoodFormPageState extends State<FoodFormPage> {
  late DateTime dateSelected = widget.dateSelected;



  newDateSelectedCallBack(DateTime daySelected) {
    setState(() {
      dateSelected = DateTime.parse("${DateFormat("yyyy-MM-dd HH:mm:ss").format(daySelected)}""Z");
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
        child: foodForm(dateSelected, context, newDateSelectedCallBack),
      ),
    );
  }
}

Form foodForm(DateTime dateSelected, BuildContext context, dayPickedCallBack) {
  DatabaseHelper db = DatabaseHelper();
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
        saveButton(context, db, foodFormKey, foodController, dateSelected)
      ],

    ),
  );

}
