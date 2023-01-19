
class Food {
  int id;
  String foodValue;
  DateTime dateTime;


  void display() {
    print(
        "Food information:\nId: $id\nDateTime: $dateTime \nfoodValue: $foodValue");
  }

  Food(
    this.id,
    this.foodValue,
    this.dateTime
);

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "foodValue" : foodValue,
      "dateTime" : dateTime
    };
  }
}

