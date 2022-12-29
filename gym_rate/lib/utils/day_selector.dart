import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';

class ExerciseDaySelector extends StatelessWidget {
  ExerciseDaySelector({Key? key, required this.changeExerciseDay})
      : super(key: key);

  final Function changeExerciseDay;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(builder: (context, val, child) {
      return Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: val.dayNames.length,
          itemBuilder: (BuildContext context, int index) {
            String _dayName = val.dayNames.keys.toList()[index];
            
            return MyButton(changeExerciseDay: changeExerciseDay, dayName: _dayName);
          },
        ),
      );
    });
  }
}

class MyButton extends StatefulWidget {
  MyButton({
    Key? key,
    required this.changeExerciseDay,
    required this.dayName,
  }) : super(key: key);
  final Function changeExerciseDay;
  final String dayName;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool a = false;

  @override
  Widget build(BuildContext context) {
    //print(" asdasd : "+dayName);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical:5),
      child: Container(
        padding:const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:a ? Colors.red : Colors.grey[300]
        ),
        child: GestureDetector(
            onTap: () {
              setState(() {
              a = true;
                
              });
              widget.changeExerciseDay(widget.dayName);
            },
            child: Text(widget.dayName)),
      ),
    );
  }
}
