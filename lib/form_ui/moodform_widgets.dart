import 'package:calendario/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:calendario/utils/settings.dart';

import '../utils/objects.dart';

 moodField(
     //controller
     ) {
 //Switch per il moodfield
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