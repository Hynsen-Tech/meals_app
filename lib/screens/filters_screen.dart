import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Gluten-free'),
            activeColor: Theme.of(context).primaryColor,
            value: _glutenFreeFilter,
            onChanged: (value) {
              setState(() {
                _glutenFreeFilter = value;
              });
            },

          )
        ],
      ),
    );
  }
}
