import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/settings.dart';

Row dateSelectorWidget(BuildContext context, DateTime dateSelected,Function callback) {
  DateTime? newDateSelected;

  void _selectDate() async {
    newDateSelected = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: defaultFirstDay,
        lastDate: defaultLastDay
    );
    callback(newDateSelected);
  }

  ElevatedButton dateSelectorButton() {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(foodPageAppBarColor)),
        onPressed: _selectDate,
        child: const Icon(Icons.calendar_today_sharp)
    );
  }
  String dateSelectedText = DateFormat('d MMM y').format(dateSelected);
  return Row(
    children: [
      Text(dateSelectedText),
      const SizedBox(width: 5),
      dateSelectorButton(),
    ],
  );
}