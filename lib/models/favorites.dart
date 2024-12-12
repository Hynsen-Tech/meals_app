import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class Favorites {

  Favorites._internal();
  static final Favorites _instance = Favorites._internal();
  factory Favorites() => _instance;

  final List<Meal> _favorites = [];

  ValueNotifier<bool> favoriteModification = ValueNotifier(false);

  List<Meal> get favoritesList {
    return _favorites;
  }

  set addFavorite(Meal meal) {
    _favorites.add(meal);
    favoriteModification.value = !favoriteModification.value;
  }

  set removeFavorite(Meal meal) {
    _favorites.removeWhere((item) => item == meal);
    favoriteModification.value = !favoriteModification.value;
  }
}