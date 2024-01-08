import 'package:flutter/material.dart';
import 'package:udemyproject3/models/expense.dart';
import 'package:udemyproject3/widgets/expence_list/expence_item.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({super.key, required this.expances,required this.onRemove});
  final List<Expense> expances;
  final void Function(Expense expense) onRemove;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: expances.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            key: ValueKey(expances[index]),
            onDismissed: (direction){
              onRemove(expances[index]);
            },
            child: ExpenceItem(expances[index] as Expense)));
  }
}
