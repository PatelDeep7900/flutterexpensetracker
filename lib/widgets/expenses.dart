import 'package:flutter/material.dart';
import 'package:udemyproject3/models/expense.dart';
import 'package:udemyproject3/widgets/Add_Expenses.dart';

import 'expence_list/expense_list.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'Flutter App',
      amount: 13,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 13,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];



  void _openaddexpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpenses(
        onAddexpanse: _addExpanses,
      ),
    );
  }
  void _removeExpance(Expense expanse) {
    final expaenseindex = _registerExpenses.indexOf(expanse);
    setState(() {
      _registerExpenses.remove(expanse);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('No item found.Please adding some!'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(label: 'Undo',
            onPressed: (){
             setState(() {
               _registerExpenses.insert(expaenseindex,expanse);
             });
            }
        )
          ));
  }

  void _addExpanses(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }



  @override
  Widget build(BuildContext context) {
    Widget minContent = const Center(
      child: Text('No Expanse found.start adding some!'),
    );
    if (_registerExpenses.isNotEmpty) {
      minContent =
          ExpenceList(expances: _registerExpenses, onRemove: _removeExpance);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openaddexpense,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: minContent),
        ],
      ),
    );
  }
}
