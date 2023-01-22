
class Food {
  String foodValue;
  DateTime dateTime;
  int? id;


  void display() {
    print(
        "Food information:\nId: $id\nDateTime: $dateTime \nfoodValue: $foodValue");
  }

  Food(
    this.foodValue,
    this.dateTime,
    [this.id]
);

  Map<String, dynamic> toMap() {
    return {
      "foodValue" : foodValue,
      "dateTime" : dateTime.toString(),
      "id" : id,
    };
  }
}

class Stool {
  int id;
  String stoolValue;
  DateTime dateTime;


  void display() {
    print(
        "Food information:\nId: $id\nDateTime: $dateTime \nfoodValue: $stoolValue");
  }

  Stool(
      this.id,
      this.stoolValue,
      this.dateTime
      );

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "foodValue" : stoolValue,
      "dateTime" : dateTime
    };
  }
}

class Mood {
  int id;
  String moodValue;
  DateTime dateTime;


  void display() {
    print(
        "Food information:\nId: $id\nDateTime: $dateTime \nfoodValue: $moodValue");
  }

  Mood(
      this.id,
      this.moodValue,
      this.dateTime
      );

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "foodValue" : moodValue,
      "dateTime" : dateTime
    };
  }
}
