import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/widgets/switch_list_tile_custom.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  void setFilter(bool filterValue, String filterType) {
    switch (filterType) {
      case 'Gluten-free':
        Filters().glutenFree = filterValue;
      case 'Lactose-free':
        Filters().lactoseFree = filterValue;
      case 'Vegetarian meals':
        Filters().vegetarian = filterValue;
      case 'Vegan meals':
        Filters().vegan = filterValue;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTileCustom(
            title: 'Gluten-free',
            description: 'Only include gluten-free recipes',
            onSelect: setFilter,
            filterValue: Filters().glutenFree,
          ),
          SwitchListTileCustom(
            title: 'Lactose-free',
            description: 'Only include lactose-free recipes',
            onSelect: setFilter,
            filterValue: Filters().lactoseFree,
          ),
          SwitchListTileCustom(
            title: 'Vegetarian meals',
            description: 'Only include vegetarian recipes',
            onSelect: setFilter,
            filterValue: Filters().vegetarian,
          ),
          SwitchListTileCustom(
            title: 'Vegan meals',
            description: 'Only include vegan recipes',
            onSelect: setFilter,
            filterValue: Filters().vegan,
          ),
        ],
      ),
    );
  }
}
