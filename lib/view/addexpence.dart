import 'dart:js_interop_unsafe';
import 'package:bugetmanagement/DBHandler/dbhHelper.dart';
import 'package:bugetmanagement/Model/Expence.dart';
import 'package:flutter/material.dart';
import 'package:bugetmanagement/view/Expencelist.dart';
import 'package:path/path.dart';

class Addexpence extends StatefulWidget {
  const Addexpence({super.key});

  @override
  State<Addexpence> createState() => _AddexpenceState();
}

class _AddexpenceState extends State<Addexpence> {
  Expense? expense;
  List<Expense>? expenseList;
   final DbManager dbManager = new DbManager();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController costController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text("AddExpense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: categoryController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Catagory",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Cost",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            //////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
  Expense model = new Expense(
                          name: nameController.text,
                          category: categoryController.text,
                          cost: double.parse(costController.text));
                       Navigator.pop(context,model);
                    },
                    child: const Text("save")),
                ElevatedButton(onPressed: () {
                   Navigator.of(context).pop();
                }, child: const Text("Cancel")),
                // Other widgets in the Row...
              ],
            ),
            //////////////

            //////////////
            // (ExpenceList?.isEmpty ?? true)
            //     ? const Text(
            //         "No data",
            //         style: TextStyle(fontSize: 20),
            //       )
            //     : Expanded(
            //child://
            ///
          ],
        ),
      ),
    );
  }

  void saveExpense() {
    String name = nameController.text.trim();
    String category = categoryController.text.trim();
    String cost = costController.text.trim();

    if (name.isNotEmpty && category.isNotEmpty && cost.isNotEmpty) {
      setState(() {
        //   ExpenceList?.add(Expence(name: name, category: category, cost: cost));
        // Clear text controllers after saving
        nameController.clear();
        categoryController.clear();
        costController.clear();
      });
    }
  }
}

  /////////////////

 
  ////////

  /////////
// }
