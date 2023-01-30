import 'package:calendario/form_ui/save_buttons.dart';
import 'package:flutter/material.dart';
import 'package:calendario/utils/settings.dart';
import 'package:intl/intl.dart';
import '../form_ui/value_pickers.dart';


class MoodFormPage extends StatefulWidget {
  const MoodFormPage({Key? key, required this.dateSelected}) : super(key: key);
  final DateTime dateSelected;

  @override
  State<MoodFormPage> createState() => _MoodFormPageState();
}

class _MoodFormPageState extends State<MoodFormPage> {
  late DateTime dateSelected = widget.dateSelected;
  double moodSelected = 1.0;

  newDateSelectedCallBack(DateTime daySelected) {
    setState(() {
      dateSelected = DateTime.parse("${DateFormat("yyyy-MM-dd HH:mm:ss").format(daySelected)}""Z");
    });
  }

  _sliderCallBack(double newValue) {
    setState(() {
      moodSelected = newValue;
    });
  }

  Form moodForm(BuildContext context, DateTime dateSelected,
      dayPickedCallBack) {
    GlobalKey<FormState> moodFormKey = GlobalKey<FormState>();


    return Form(
      key: moodFormKey,
      child: Column(
        children: [
          Text("Value selected: ${moodSelected.toInt().toString()}"),
          moodStoolValuePicker(moodSelected, _sliderCallBack,
              moodPageAppBarColor),
          Align(
              alignment: Alignment.centerLeft,
              child: datePicker(context, dateSelected,
                dayPickedCallBack, moodPageAppBarColor)),
          saveMoodBtn(context, moodFormKey, moodSelected.toInt(), dateSelected)
        ],

      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodPageAppBarColor,
        title: const Text("Insert a new mood!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: moodForm(context, dateSelected, newDateSelectedCallBack),
      ),
    );
  }
}
