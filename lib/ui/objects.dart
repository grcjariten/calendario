
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

List<Food> foods= [
  Food(1, "Banana e Mango", DateTime.parse("2023-01-19 00:00:00.000Z")),
  Food(2, "Beans", DateTime.parse("2023-01-18 00:00:00.000Z")),
];