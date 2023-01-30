import 'package:flutter/material.dart';
import 'package:calendario/utils/objects.dart';
import 'package:calendario/utils/database_helper.dart';
import 'package:calendario/utils/settings.dart';

ElevatedButton saveFoodBtn(
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

//TODO: Create SaveMoodBtn(), SaveStoolBtn()
ElevatedButton saveMoodBtn(
    BuildContext context,
    GlobalKey<FormState> formKey,
    int moodValue,
    DateTime dateSelected) {
  final db = DatabaseHelper();

  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(moodPageAppBarColor)),
    child: const Text("Save"),

    onPressed: () {
      if(formKey.currentState!.validate()) {
        final newMood = Mood(moodValue, dateSelected);
        //Inserting a new Mood TODO: First create a new method for inserting a new Mood in the DB.
        // db.insertMood(newMood).then((id) {
        //   newMood.id = id;
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text("New Data saved! id: $id")));
        // });

        //Generating a new Item to pop back
        final itemPopped = Item(newMood, newMood.moodValue.toString(), moodColor);
        Navigator.pop(context, itemPopped);
      }
    },
  );
}