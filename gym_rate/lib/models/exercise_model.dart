import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseData extends ChangeNotifier {
  final double? weight;
  final Duration? restTime;
  final int? sets;
  final int? reps;
  final String? rpe;
  final String? name;
  final String? day;
  // If day is null that mean the user doesn't apply this exercise on his Exerciese program.
  // User can give a special name to the exercise day.
  //Example : Volume day, Control Day.
  //Otherwise days will be named like Day 1,Day 2...

  ExerciseData({
    required this.name,
    required this.reps,
    required this.restTime,
    required this.rpe,
    required this.sets,
    required this.weight,
    this.day,
  });

  final List exerciseList = [
    {
      "name": "TnG Bench Press",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Volume Day",
    },
    {
      "name": "TnG Bench Press",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Volume Day",
    },
    {
      "name": "TnG Bench Press",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Volume Day",
    },
    {
      "name": "TnG Bench Press",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Volume Day",
    },
    {
      "name": "Squat",
      "reps": 3,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Volume Day",
    },
    {
      "name": "Machine Row",
      "reps": 10,
      "restTime": Duration(minutes: 2),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Volume Day",
    },
    {
      "name": "Squat",
      "reps": 3,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Control Day",
    },
    {
      "name": "Machine Row",
      "reps": 10,
      "restTime": Duration(minutes: 2),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Control Day",
    },
    {
      "name": "TnG Bench Press ",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Control Day",
    },
    {
      "name": "Deadlift",
      "reps": 3,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Power Day",
    },
    {
      "name": "Machine Row",
      "reps": 10,
      "restTime": Duration(minutes: 2),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 60,
      "day": "Power Day",
    },
    {
      "name": "TnG Bench Press ",
      "reps": 10,
      "restTime": Duration(minutes: 3),
      "rpe": "7 - 8.5",
      "sets": 3,
      "weight": 50,
      "day": "Power Day",
    },
  ];

  Map get dayNames {
    // this getter will seperate all exercises according to their 'day' property.
    /*
      {
        "Control Day ": [{name:"exercise 1","reps:exercise reps".....},{name:"exercise 2","reps:exercise reps".....}],
        "Volume Day ": [{name:"exercise 1","reps:exercise reps".....},{name:"exercise 2","reps:exercise reps".....}]
      }
    */
    final Map<String, List<Map>> categorizedDatabyName = {};

    for (Map item in exerciseList) {
      // print(item);

      if (categorizedDatabyName[item["day"]] == null) {
        categorizedDatabyName[item["day"]] = [item];
      } else {
        categorizedDatabyName[item["day"]]?.add(item);
      }
    }
    //print(categorizedDatabyName);
    return categorizedDatabyName;
  }

  void addExercise() {
    notifyListeners();
  }

  void updateExercise() {
    // This function will update the Exercise data for example reps of the exercise.
    notifyListeners();
  }

  void deleteExercise() {
    notifyListeners();
  }
}
