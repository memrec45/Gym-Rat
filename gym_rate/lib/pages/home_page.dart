import 'package:flutter/material.dart';
import 'package:gym_rate/models/exercise_model.dart';
import 'package:gym_rate/utils/day_selector.dart';
import 'package:gym_rate/utils/my_appbar.dart';
import 'package:provider/provider.dart';

import '../utils/exercise_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDay = "Volume Day";

  void changeSelectedDay(String name) {
    setState(() {
      selectedDay = name;
    });

    //print(selectedDay);
  }

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MyAppBar(context),
      ),
      bottomNavigationBar: MyNavigationBar(context),
      body: Consumer<ExerciseData>(
        builder: (context, val, child) {
          //selectedDay = val.dayNames.keys.toList()[0];
          return Column(
            children: [
              Expanded(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "$selectedDay",
                              style:const TextStyle(
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
                    // Container(
                    //   //height: 500,
                    //   child: Consumer<ExerciseData>(
                    //     builder: (context, val, child) {
                    //       return ExerciseTile(
                    //         selectedDay: selectedDay,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),

              // ExerciseDaySelector(
              //   changeExerciseDay: changeSelectedDay,
              // ),
            ],
          );
        },
      ),
    );
  }
}
