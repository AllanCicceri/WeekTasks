import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;
  final bool done;

  Task(this.title, this.description, this.date, this.done);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Column(
          children: [
            Text(DateFormat('dd/MM/y').format(date),
                style: TextStyle(
                  fontSize: 12,
                )),
            Flexible(
              child: Checkbox(
                value: false,
                onChanged: (_) => true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
