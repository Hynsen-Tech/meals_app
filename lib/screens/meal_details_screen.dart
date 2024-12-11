import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_widgets/meal_details_ingredients.dart';
import 'package:meals_app/widgets/meal_widgets/meal_details_preparation.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: ListView(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: meal.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          MealDetailsIngredients(meal.ingredients),
          MealDetailsPreparation(meal.steps)
        ],
      ),
    );
  }
}
