import 'package:calendario/formpages/foodFormPage.dart';
import 'package:calendario/formpages/moodFormPage.dart';
import 'package:calendario/formpages/stoolFormPage.dart';
import 'package:calendario/utils/settings.dart';
import 'package:flutter/material.dart';
import '../utils/objects.dart';


//FloatingActionButton
FloatingActionButton insertFloating(DateTime dateSelected, ObjectType type, BuildContext context, Function refreshCallBack) {
  foodActionButton() {
    return FloatingActionButton(
        heroTag: "foodTag",
        backgroundColor: insertFloatingFoodColor,
        child: const Text("+\nFood", textAlign: TextAlign.center,),
        onPressed: () async {
          Item? item = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => FoodFormPage(dateSelected: dateSelected)));
          refreshCallBack(item);
        }
    );
  }

  moodActionButton() {
    return FloatingActionButton(
      heroTag: "moodTag",
        backgroundColor: insertFloatingMoodColor,
        child: const Text("+\nMood", textAlign: TextAlign.center,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MoodFormPage(dateSelected: dateSelected))).then((_) => refreshCallBack
          );
        }
    );
  }
  stoolActionButton() {
    return FloatingActionButton(
        heroTag: "stoolTag",
        backgroundColor: insertFloatingStoolColor,
        child: const Text("+\nStool", textAlign: TextAlign.center,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StoolFormPage(dateSelected: dateSelected,))).then((_) => refreshCallBack()
          );
        }
    );
  }
  if(type == ObjectType.food) {
      return foodActionButton();
  }
  else if(type == ObjectType.mood) {
      return moodActionButton();
  } else if(type == ObjectType.stool) {
      return stoolActionButton();
  }
  else {
return FloatingActionButton(onPressed: () {});
}
}


