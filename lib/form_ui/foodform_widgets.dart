import 'package:calendario/utils/database_helper.dart';
import 'package:flutter/material.dart';
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


ElevatedButton saveButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController foodController,
    DateTime dateSelected) {
  final db = DatabaseHelper();

  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(foodPageAppBarColor)),
    child: const Text("Save"),

    onPressed: () {
      if(formKey.currentState!.validate()) {
        final newFood = Food(foodController.text, dateSelected);
        //Inserting a new Food
        db.insertFood(newFood).then((id) {
          newFood.id = id;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("New Data saved! id: $id")));
        });

        //Generating a new Item to pop back
        final itemPopped = Item(newFood, newFood.foodValue, foodColor);
        Navigator.pop(context, itemPopped);
      }
},
  );
}