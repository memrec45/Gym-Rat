import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).primaryColor,
  );
}

Widget MyNavigationBar(BuildContext context){
  return BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {
            // This will change the currentIndex parameter
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_view),
              label: "Track",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_sharp),
              label: "Nutrition",
              tooltip: "Nutrition",
            ),
          ],
        );
}