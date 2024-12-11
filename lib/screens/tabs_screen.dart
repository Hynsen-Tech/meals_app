import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageSelected = 0;

  void selectPage(int index) {
    setState(() {
      _pageSelected = index;
    });
  }

  void _setScreen(String identifier) {}

  @override
  Widget build(BuildContext context) {
    Widget screenSelected = const CategoriesScreen();
    String appBarTitle = 'Categories';

    if (_pageSelected == 1) {
      appBarTitle = 'Favorites';
      screenSelected = const MealsScreen(meals: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: Drawer(
        child: MainDrawer(
          onSelectScreen: _setScreen,
        ),
      ),
      body: screenSelected,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: _pageSelected,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_outlined), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), label: 'Favorites')
          ]),
    );
  }
}