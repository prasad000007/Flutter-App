import 'package:bugetmanagement/view/Expencelist.dart';
import 'package:bugetmanagement/view/addexpence.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  double expenseTotal = 0.0;
  @override
  void initState() {
    super.initState();
  }

  var budgetValue = 1233;
  var balance = 0;

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
      //theme:ThemeData(primarySwatch: Colors.deepPurple),
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              "Dashboard",
              style: TextStyle(color: Colors.black),
            ),
          )),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                  child: GestureDetector(
                    onTap: () async {
                      final result = await  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExpenseList()));
                     
                      setState(() {
                         expenseTotal = result as double ;
                      });
                    },
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
            ]),
      ),
    );
  }
}
