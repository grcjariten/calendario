import 'package:flutter/material.dart';
import '../utils/database_helper.dart';
import '../utils/objects.dart';
import '../utils/settings.dart';

ElevatedButton saveButton(
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