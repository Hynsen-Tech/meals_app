import 'package:flutter/material.dart';
import 'package:meals_app/models/favorites.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_widgets/meal_details_ingredients.dart';
import 'package:meals_app/widgets/meal_widgets/meal_details_more_info.dart';
import 'package:meals_app/widgets/meal_widgets/meal_details_preparation.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen(this.meal, {super.key});

  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = Favorites().favoritesList.contains(widget.meal);


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                Favorites().removeFavorite = widget.meal;
              } else {
                Favorites().addFavorite = widget.meal;
              }
              setState(() {
              });
            },
            icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.meal.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          MealDetailsMoreInfo(widget.meal),
          MealDetailsIngredients(widget.meal.ingredients),
          MealDetailsPreparation(widget.meal.steps)
        ],
      ),
    );
  }
}
