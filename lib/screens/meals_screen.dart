import 'package:flutter/material.dart';
import 'package:meals_app/models/favorites.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_widgets/meal_listview_item.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, this.title, required this.meals,});

  final String? title;
  final List<Meal> meals;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Favorites favorites = Favorites();

  @override
  void initState() {
    favorites.favoriteModification.addListener(refreshPage);
    super.initState();
  }

  @override
  void dispose() {
    favorites.favoriteModification.removeListener(refreshPage);
    super.dispose();
  }

  void refreshPage() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget listViewElem;


    if (widget.meals.isNotEmpty) {
      listViewElem = ListView.builder(
          itemCount: widget.meals.length,
          itemBuilder: (context, index) {
            return MealListviewItem(widget.meals[index]);
          });
    } else {
      listViewElem = Center(
          child: Text(
        'No recipes found!',
        style: Theme.of(context).textTheme.titleLarge,
      ));
    }

    return widget.title == null ? listViewElem : Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: listViewElem
    );
  }
}
