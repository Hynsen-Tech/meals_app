import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsMoreInfo extends StatelessWidget {
  const MealDetailsMoreInfo(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;

    Widget propsTextWidget(String props, bool isTrue) {
      return Row(
        children: [
          Text(
            props,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.grey[900],
              fontSize: 18,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Icon(
            isTrue ? Icons.done : Icons.close,
            color: isTrue ? Colors.green : Colors.red,
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              propsTextWidget('Gluten-Free', meal.isGlutenFree),
              const Spacer(),
              propsTextWidget('Lactose-Free', meal.isLactoseFree),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              propsTextWidget('Vegetarian', meal.isVegetarian),
              const Spacer(),
              propsTextWidget('Vegan', meal.isVegan),
            ],
          )
        ],
      ),
    );
  }
}
