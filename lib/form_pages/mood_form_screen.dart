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

  newDateSelectedCallBack(DateTime daySelected) {
    setState(() {
      dateSelected = DateTime.parse("${DateFormat("yyyy-MM-dd HH:mm:ss").format(daySelected)}""Z");
    });
  }

  Form moodForm(BuildContext context, DateTime dateSelected,
      dayPickedCallBack) {
    GlobalKey<FormState> moodFormKey = GlobalKey<FormState>();
    TextEditingController moodSelected;


    return Form(
      key: moodFormKey,
      child: Column(
        children: [
          // moodSelector(moodSelected), //TODO: Work on how to select a value
          Align(
              alignment: Alignment.centerLeft,
              child: dateSelectorWidget(context, dateSelected,
                dayPickedCallBack, moodPageAppBarColor)),
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
