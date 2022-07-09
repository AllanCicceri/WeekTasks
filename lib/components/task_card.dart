import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  bool done;

  Task(this.id, this.title, this.description, this.date, this.done);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    print('situação: ${widget.done}');
    return Card(
      elevation: 6,
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.description,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Column(
          children: [
            Text(DateFormat('dd/MM/y').format(widget.date),
                style: TextStyle(
                  fontSize: 12,
                )),
            Flexible(
              child: Checkbox(
                value: widget.done,
                onChanged: (_) {
                  setState(() {
                    widget.done = !widget.done;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
