import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';

class ExerciseDaySelector extends StatelessWidget {
  ExerciseDaySelector(
      {Key? key, required this.changeExerciseDay, required this.selectedDay})
      : super(key: key);

  final Function changeExerciseDay;
  final selectedDay;
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(builder: (context, val, child) {
      return Container(
        height: 52,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: val.dayNames.length,
          itemBuilder: (BuildContext context, int index) {
            String _dayName = val.dayNames.keys.toList()[index];

            return MyButton(
              changeExerciseDay: changeExerciseDay,
              dayName: _dayName,
              selectedDay: selectedDay,
            );
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
    required this.selectedDay,
  }) : super(key: key);
  final Function changeExerciseDay;
  final String dayName;
  final String selectedDay;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  // bool a = false;

  @override
  Widget build(BuildContext context) {
    //print(" asdasd : "+dayName);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: GestureDetector(
        onTap: () {
          widget.changeExerciseDay(widget.dayName);
        },
        child: Container(
          //height: 150,
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: widget.selectedDay == widget.dayName
            //     ? Colors.red
            //     : Colors.grey[300],
          ),
          child: Column(
            children: [
              Text(
                widget.dayName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              widget.selectedDay == widget.dayName
                  ? const SizedBox(
                      width: 100,
                      child: Divider(
                        thickness: 3,
                        color: Colors.red,
                        endIndent: 25,
                        indent: 25,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
