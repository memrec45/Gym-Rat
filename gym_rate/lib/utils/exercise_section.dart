import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';
import 'day_selector.dart';
import 'exercise_tile.dart';

class ExercisesSection extends StatefulWidget {
  ExercisesSection({Key? key}) : super(key: key);

  @override
  State<ExercisesSection> createState() => _ExercisesSectionState();
}

class _ExercisesSectionState extends State<ExercisesSection> {
  //TODO: define the selected day in initState()
  String selectedDay = "Volume Day";

  void _onPageChanged(var val, int pageIndex) {
    setState(
      () {
        selectedDay = val.dayNames.keys.toList()[pageIndex];
      },
    );
  }

  void changeExerciseDay(String _dayName) {
    setState(() {
      selectedDay = _dayName;
    });
  }

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(builder: (context, val, child) {
      final double maxHeight = MediaQuery.of(context).size.height;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExerciseDaySelector(
            changeExerciseDay: changeExerciseDay,
            selectedDay: selectedDay,
          ),
          const Divider(
            thickness: 2,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              height: maxHeight * 0.31,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: val.dayNames.length,
                controller: _pageController,
                onPageChanged: (pageIndex) => _onPageChanged(val, pageIndex),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: maxHeight * 0.3,
                          child: ExerciseTile(
                            selectedDay: selectedDay,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
