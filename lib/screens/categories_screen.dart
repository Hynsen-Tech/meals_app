import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Category> categories = availableCategories;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4 / 3,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: [
        for (Category category in availableCategories)
          AnimatedBuilder(
            animation: _animationController,
            child: CategoryGridItem(category),
            builder: (context, child) => ScaleTransition(
              scale: CurvedAnimation(
                  parent: _animationController, curve: Curves.easeOutBack),
              child: child,
            ),
          )
      ],
    );
  }
}
