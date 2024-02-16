

class Expense {
  String? name;
  String? category;
  double? cost;
  Expense({required this.name , required this.category , required this.cost});


  Expense.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
    category = json['category'];
  }

 Map<String, dynamic> toJson() => {
        "name": name,
        "cost": cost.toString(),
        "category": category
      };
}
