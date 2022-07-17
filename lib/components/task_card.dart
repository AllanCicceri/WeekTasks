import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  bool done;
  void Function(int id) _setTaskDone;

  Task(this.id, this.title, this.description, this.date, this.done,
      this._setTaskDone);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        tileColor: widget.done
            ? Theme.of(context).listTileTheme.selectedColor
            : Theme.of(context).listTileTheme.tileColor,
        title: Text(
          widget.title,
          style: widget.done
              ? Theme.of(context).textTheme.headline3
              : Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text(
          widget.description,
          style: Theme.of(context).textTheme.headline3,
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(DateFormat('dd/MM/y').format(widget.date),
                    style: Theme.of(context).textTheme.headline3),
              ),
              Flexible(
                child: Container(
                  child: Checkbox(
                    value: widget.done,
                    onChanged: (_) {
                      widget._setTaskDone(widget.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
