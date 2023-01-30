import 'package:flutter/material.dart';
import 'package:calendario/utils/settings.dart';
import 'package:intl/intl.dart';
import '../form_ui/value_pickers.dart';


class StoolFormPage extends StatefulWidget {
  const StoolFormPage({Key? key, required this.dateSelected}) : super(key: key);
  final DateTime dateSelected;

  @override
  State<StoolFormPage> createState() => _StoolFormPageState();
}

class _StoolFormPageState extends State<StoolFormPage> {
  late DateTime dateSelected = widget.dateSelected;
  double stoolSelected = 7.0;

  newDateSelectedCallBack(DateTime daySelected) {
    setState(() {
      dateSelected = DateTime.parse("${DateFormat("yyyy-MM-dd HH:mm:ss").format(daySelected)}""Z");
    });
  }

  _sliderCallBack(double newValue) {
    setState(() {
      stoolSelected = newValue;
    });
  }

  Form stoolForm(BuildContext context, DateTime dateSelected,
      dayPickedCallBack) {
    GlobalKey<FormState> stoolFormKey = GlobalKey<FormState>();


    return Form(
      key: stoolFormKey,
      child: Column(
        children: [
          Text("Value selected: ${stoolSelected.toInt().toString()}"),
          moodStoolValuePicker(stoolSelected, _sliderCallBack,
              stoolPageAppBarColor),
          Align(
              alignment: Alignment.centerLeft,
              child: datePicker(context, dateSelected,
                  dayPickedCallBack, stoolPageAppBarColor)),
          // saveButton(context, moodFormKey, moodSelected, dateSelected)
          // TODO: Work on saveButton first.
        ],

      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: stoolPageAppBarColor,
        title: const Text("Insert a new stool!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: stoolForm(context, dateSelected, newDateSelectedCallBack),
      ),
    );
  }
}
