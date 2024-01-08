import 'package:flutter/material.dart';
import 'package:udemyproject3/models/expense.dart';

class AddExpenses extends StatefulWidget {
  AddExpenses({super.key,required this.onAddexpanse});
  final void Function(Expense expense) onAddexpanse;
  @override
  State<AddExpenses> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _category = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;

  void _datePiker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    final pikedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pikedDate;
    });
  }
void _SubmitExpanceData(){
    final enterdAmount = double.tryParse(_amountController.text);
    final validationamount = enterdAmount == null || enterdAmount <= 0;
    if(_titleController.text.trim().isEmpty || validationamount || _selectedDate == null){
       showDialog(context: context, builder: (ctx)=>AlertDialog(
         title: Text('Invalid Input'),
         content: Text('Please make sure a valid title,amount,date and category was entered'),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(ctx);
           },
               child: Text('Okay'))
         ],
       ));
       return;
    }
    widget.onAddexpanse(Expense(title: _titleController.text, amount: enterdAmount, date: _selectedDate!, category: _category));
    Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? "Date Not Selected"
                      : formater.format(_selectedDate!)),
                  IconButton(
                      onPressed: _datePiker, icon: Icon(Icons.calendar_month)),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: _category,
                  items: Category.values
                      .map((catagory) =>
                          DropdownMenuItem(
                              value: catagory,
                              child: Text(catagory.name.toUpperCase()),
                          )
                  )
                      .toList(),
                  onChanged: (value){
                  if(value == null){
                    return;
                  }
                    setState(() {
                      _category = value;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: _SubmitExpanceData,
                child: const Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
