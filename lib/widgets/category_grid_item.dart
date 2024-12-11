import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> mealsByCategory = dummyMeals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealsScreen(category.title, mealsByCategory)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.7),
                category.color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white
          )
        ),
      ),
    );
  }
}
