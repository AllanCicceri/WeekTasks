import 'package:flutter/material.dart';
import '../models/task_model.dart';

class Task extends StatelessWidget {
  final String title;
  final String description;

  Task(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          child: Card(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(description),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
