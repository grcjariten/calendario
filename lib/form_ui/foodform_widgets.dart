import 'package:calendario/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendario/utils/settings.dart';

import '../utils/objects.dart';

TextFormField foodField(TextEditingController foodController) {
  return TextFormField(
    validator: (value) {
      if(value == null || value.isEmpty) {
        return "Please enter a food here";
      }
      return null;
    },
    controller: foodController,
    decoration: const InputDecoration(
        hintText: "Enter a food"
    ),
  );
}

Row dateSelectorWidget(BuildContext context, DateTime dateSelected, Function callback) {
  DateTime? newDateSelected;

  ElevatedButton dateSelectorButton() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(foodPageAppBarColor)),
      child: const Icon(Icons.calendar_today_sharp),
      onPressed: () async {
        newDateSelected = await showDatePicker(
            context: context,
            initialDate: today,
            firstDate: defaultFirstDay,
            lastDate: defaultLastDay);
        callback(newDateSelected);
      }, );
  }

  Text dateSelectedDisplayed(dateSelected) {
    return Text(DateFormat('d MMM y').format(dateSelected));
  }
  return Row(
    children: [
      dateSelectedDisplayed(dateSelected),
      const SizedBox(width: 5),
      dateSelectorButton(),
    ],
  );
}

ElevatedButton saveButton(BuildContext context, GlobalKey<FormState> formKey, TextEditingController foodController, DateTime dateSelected) {
  DatabaseHelper db = DatabaseHelper();

  return ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(foodPageAppBarColor)),
    child: const Text("Save"),
    onPressed: () {
      if(formKey.currentState!.validate()) {
        Food newFood = Food(foodController.text, dateSelected);

        db.insertFood(newFood).then((id) {
          newFood.id = id;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("New Data saved! id: $id")));
        });
        Item itemPopped = Item(newFood, newFood.foodValue, foodColor);
        Navigator.pop(context, itemPopped);
      }
},
  );
}