import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendario/utils/settings.dart';

TextFormField foodField(TextEditingController foodController) {
  return TextFormField(
    controller: foodController,
    decoration: const InputDecoration(
        hintText: "Enter a food"
    ),
  );
}

Row dateSelectorWidget(DateTime dateSelected, Function callback, BuildContext context) {
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