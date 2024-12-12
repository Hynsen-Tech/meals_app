import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark
          ? Theme.of(context).primaryColor
          : Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 100,
                  color: isDark
                      ? Colors.green[700]
                      : Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Cooking up!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? Colors.green[700]
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.restaurant,
              size: 30,
              color:
                  isDark ? Colors.green[700] : Theme.of(context).primaryColor,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24,
                color:
                    isDark ? Colors.green[700] : Theme.of(context).primaryColor,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
            },
            leading: Icon(
              Icons.settings,
              size: 30,
              color:
                  isDark ? Colors.green[700] : Theme.of(context).primaryColor,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                fontSize: 24,
                color:
                    isDark ? Colors.green[700] : Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
