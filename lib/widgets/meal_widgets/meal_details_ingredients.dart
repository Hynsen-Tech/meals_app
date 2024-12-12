import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsIngredients extends StatelessWidget {
  const MealDetailsIngredients(this.ingredients, {super.key});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INGREDIENTS',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: isDark
                        ? Colors.green[700]
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              for (int index = 0; index < ingredients.length; index++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Text(
                      ingredients[index],
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: index < ingredients.length - 1 ? 18 : 0,
                    ),
                    Container(
                      height: index < ingredients.length - 1 ? 0.3 : 0,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.grey),
                    )
                  ],
                ),
            ],
          ),
        ));
  }
}
