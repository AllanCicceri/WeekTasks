import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  final void Function(String, String, DateTime) onSubmit;
  final void Function() sortList;

  TaskForm(this.onSubmit, this.sortList);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  _TaskFormState();
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descriptionContoller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      widget.onSubmit(
          titleContoller.text, descriptionContoller.text, _selectedDate);
      widget.sortList();
    }

    _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: _selectedDate,
              lastDate: _selectedDate.add(Duration(days: 7)))
          .then((datePicked) {
        if (datePicked != null) {
          _selectedDate = datePicked;
        }
      });
    }

    return Card(
      child: Column(
        children: [
          TextField(
            controller: titleContoller,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionContoller,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          Row(
            children: [
              Text(DateFormat('dd/MM/y').format(_selectedDate)),
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
