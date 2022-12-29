import 'package:flutter/material.dart';
import 'package:gym_rate/models/exercise_model.dart';
import 'package:gym_rate/utils/day_selector.dart';
import 'package:gym_rate/utils/my_appbar.dart';
import 'package:provider/provider.dart';

import '../utils/exercise_section.dart';
import '../utils/exercise_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MyAppBar(context),
      ),
      bottomNavigationBar: MyNavigationBar(context),
      body: Column(
        children: [
          ExercisesSection(),
        ],
      ),
    );
  }
}
