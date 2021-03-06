import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todoapp/components/task_form.dart';
import 'package:todoapp/models/task_model.dart';
import 'components/task_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TaskModel> _tasksList = [];

  _addTask(String title, String desc, DateTime date) {
    setState(() {
      final id = Random().nextInt(500);
      TaskModel myTask = TaskModel(id, title, desc, date, false);

      _tasksList.add(myTask);
    });
  }

  _showAddTaskFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskForm(_addTask, _sortList);
        });
  }

  _sortList() {
    setState(() {
      List<TaskModel> saveStateList = _tasksList;
      _tasksList.sort((a, b) {
        if (b.done) {
          return -1;
        }
        return 1;
      });

      _tasksList.forEach((element) {
        saveStateList.forEach((el) {
          if (el.id == element.id) {
            element.done = el.done;
            return;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setTaskDone(id) {
      _tasksList.forEach((element) {
        if (element.id == id) {
          element.done = !element.done;
        }
      });
      _sortList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Week Tasks',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  _showAddTaskFormModal(context);
                },
                child: Icon(Icons.add, color: Colors.grey[850]),
                backgroundColor: Colors.white,
              ))
        ],
      ),
      body: _tasksList.length == 0
          ? Text('No tasks this week...')
          : Column(
              children: _tasksList.map((task) {
                return Container(
                    height: 100,
                    child: Task(task.id, task.title, task.description,
                        task.date, task.done, (_) => _setTaskDone(task.id)));
              }).toList(),
            ),
    );
  }
}
