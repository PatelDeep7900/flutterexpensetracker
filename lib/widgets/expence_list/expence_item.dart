import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenceItem extends StatelessWidget{
 const ExpenceItem(this.expense,{super.key});

final Expense expense;
  @override
  Widget build(BuildContext context) {
     return Card(
       child: Padding(
         padding: const EdgeInsets.symmetric(
           horizontal: 20,
           vertical: 16,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
             Row(
               children: [
                 Text('\$${expense.amount.toStringAsFixed(2)}'),
                 const Spacer(),
                 Row(
                   children: [
                     Icon(CategoryIcons[expense.category]),
                     SizedBox(width: 8,),
                     Text(expense.formateDate),
                   ],
                 ),
               ],
             )
           ],
         ),
       ),
     );
  }

}