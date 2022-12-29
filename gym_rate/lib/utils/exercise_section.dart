import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';
import 'exercise_tile.dart';

class ExercisesSection extends StatefulWidget {
  ExercisesSection({Key? key}) : super(key: key);

  @override
  State<ExercisesSection> createState() => _ExercisesSectionState();
}

class _ExercisesSectionState extends State<ExercisesSection> {
  String selectedDay = "Volume Day";

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseData>(builder: (context, val, child) {
      return Expanded(
        //height: 300,
        child: PageView.builder(
          itemCount: val.dayNames.length,
          controller: _pageController,
          onPageChanged: (int pageIndex) {
            setState(
              () {
                selectedDay = val.dayNames.keys.toList()[pageIndex];
              },
            );
          },
          itemBuilder: (context, index) {
            //asdasdad
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "$selectedDay",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 5,
                  ),
                  Container(
                    height: 300,
                    child: ExerciseTile(
                      selectedDay: selectedDay,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
