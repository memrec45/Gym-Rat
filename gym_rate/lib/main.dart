import 'package:flutter/material.dart';
import 'package:gym_rate/models/exercise_model.dart';
import 'package:gym_rate/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ExerciseData(
      name: "",
      reps: 0,
      restTime: Duration(minutes: 0),
      rpe: "0",
      sets: 0,
      weight: 60,
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      debugShowCheckedModeBanner: false,
      title: "asdadad",
      home: HomePage(),
    );
  }
}
