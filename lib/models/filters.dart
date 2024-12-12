class Filters {

  Filters._internal();
  static final Filters _instance = Filters._internal();
  factory Filters() => _instance;//Factory constructor of the singleton class


  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegetarian = false;
  bool vegan = false;
}
