import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  final void Function(String, String) onSubmit;

  TaskForm(this.onSubmit);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  _TaskFormState();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    _submitForm() {
      widget.onSubmit('MeuTitulo', 'MinhaDescricao');
    }

    _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: date,
          firstDate: date.subtract(Duration(days: 7)),
          lastDate: date.add(Duration(days: 7)));
    }

    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
          ),
          Row(
            children: [
              Text(DateFormat('dd/MM/y').format(date)),
              IconButton(
                  onPressed: _showDatePicker, icon: Icon(Icons.date_range)),
            ],
          ),
          TextButton(onPressed: _submitForm, child: Text('Submit')),
        ],
      ),
    );
  }
}
