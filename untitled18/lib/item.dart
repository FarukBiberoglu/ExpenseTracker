import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled18/expense_model.dart'; // ExpenseModel sınıfını ekleyin

class Item extends StatelessWidget {
  final ExpenseModel expense; // ExpenseModel tipinde bir değişken
  final VoidCallback onDelete; // Silme işlevi için bir geri çağırma fonksiyonu

  const Item({
    Key? key,
    required this.expense, // ExpenseModel alacak
    required this.onDelete, // Silme işlevi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          expense.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: expense.isIncome ? Colors.green : Colors.red,
          size: 30,
        ),
        title: Text(
          expense.item,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              "\$${expense.amount}",
              style: TextStyle(
                fontSize: 16,
                color: expense.isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              DateFormat.yMMMMd().format(expense.date),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
