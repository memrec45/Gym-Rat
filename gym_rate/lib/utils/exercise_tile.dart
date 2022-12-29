import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';

class ExerciseTile extends StatefulWidget {
  ExerciseTile({Key? key, required this.selectedDay}) : super(key: key);

  //final int index;
  final String selectedDay;

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  // List <Color> _colors = [
  @override
  Widget build(BuildContext context) {
    //print(widget.selectedDay);
    return Consumer<ExerciseData>(builder: (context, exercise, child) {
      return ListView.builder(
          itemCount: exercise.dayNames[widget.selectedDay].length,
          itemBuilder: (BuildContext context, index) {
            //Map exerciseData = exercise.exerciseList[index];
            Map exerciseData = exercise.dayNames[widget.selectedDay][index];
            return Card(
              elevation: 2,
              //color: _colors[Random().nextInt(_colors.length-1)],
              child: ListTile(
                title: Text(
                  exerciseData["name"],
                ),
                subtitle: Text(
                  "${exerciseData['sets']} x ${exerciseData['reps']} || ${exerciseData['restTime'].inMinutes} mins",
                ),
                trailing: Text(
                  "${exerciseData['weight']} kg",
                ),
              ),
            );
          });
    });
  }
}
