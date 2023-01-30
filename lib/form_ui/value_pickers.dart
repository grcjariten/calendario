import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/settings.dart';

TextFormField foodValuePicker(TextEditingController foodController) {
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

Slider moodStoolValuePicker(double value, Function callBack, Color
sliderColor) {
  return Slider(
    activeColor: sliderColor,
          min: 1,
          max: 10,
          divisions: 9,
          value: value,
          onChanged: (double newValue)  {
            callBack(newValue);
          }

  );

}


Row datePicker(BuildContext context, DateTime dateSelected, Function
callback, Color buttonColor) {
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
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
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