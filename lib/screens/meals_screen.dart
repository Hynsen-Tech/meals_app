import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_widgets/meal_listview_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.title, this.meals, {super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final Widget listViewElem;

    if (meals.isNotEmpty) {
      listViewElem = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealListviewItem(meals[index]);
          });
    } else {
      listViewElem = Center(
          child: Text(
        'No recipes found!',
        style: Theme.of(context).textTheme.titleLarge,
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: listViewElem);
  }
}