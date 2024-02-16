import 'package:bugetmanagement/DBHandler/dbhHelper.dart';
import 'package:bugetmanagement/Model/Expence.dart';
import 'package:flutter/material.dart';
import 'package:bugetmanagement/view/addexpence.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final DbManager dbManager = new DbManager();
  double? expenseTotal;

  var budgetValue = 1233;
  var balance = 0;
  List<Expense>? expenceList = [
    Expense(name: "samosa", category: "Food", cost: 25.0),
    Expense(name: "Thali", category: "Food", cost: 50.0)
  ];

  @override
  void initState() {
    expenseTotal = 0.0;
    expenseAdd();
    super.initState();
  }

  void expenseAdd() {
    expenseTotal = 0.0;
    for (int i = 0; i < expenceList!.length; i++) {
      expenseTotal = expenseTotal! + expenceList![i].cost!;
    }
  }

  @override
  Widget build(BuildContext context) {
    int calculateRemainingBudget(budgetValue, expence) {
      //calculation
      setState(() {
        balance = budgetValue - expence;
      });
      return balance;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Expense List",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      width: 500,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        itemCount: expenceList?.length,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var expense = expenceList![index];
                          return getRow(expense);
                        },
                      )),
                ),
                Text(
                  "Budget Overview",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Budget = ",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Text(
                        "\u{20B9}$budgetValue",
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Expence = ",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            "\u{20B9} ${expenseTotal}",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: const Color.fromARGB(255, 180, 11, 11)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Balance = ",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Text(
                        "\u{20B9}${calculateRemainingBudget(budgetValue, expenseTotal)}",
                        style: TextStyle(fontSize: 15.0, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Addexpence()));

                      expenceList?.add(result);
                      expenseAdd();
                      setState(() {});
                    },
                    // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                    style: ElevatedButton.styleFrom(
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white)),
                    child: const Text('Add Expense'),
                  ),
                ),
              ]),
        ));
  }

  Widget getRow(Expense expence) {
    return ListTile(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Name: " + expence.name! + " || "),
              Text("Category: " + expence.category! + " || "),
              Text("Cost: " + expence.cost!.toString() + " || "),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
  // double calculateTotalExpense() {
  //   double total = 0.0;
  //   for (var expense in expenseList!) {
  //     // total += expense.cost;
  //   }
  //   return total;
  // }
}

// Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Expense = ",
//                     style: TextStyle(fontSize: 16.0, color: Colors.black),
//                   ),
//                   Text(
//                     "\u{20B9}${"calculateTotalExpense()"}",
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: const Color.fromARGB(255, 180, 11, 11),
//                     ),
//                   ),
//                 ],
//               ),

class ItemCard extends StatefulWidget {
  Expense? model;
  // Function? onDeletePress;
  // Function? onEditPress;

  ItemCard({
    this.model,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final DbManager dbManager = new DbManager();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${widget.model?.name}',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'cost: ${widget.model?.cost}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
