import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_widgets/meal_item_info.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListviewItem extends StatelessWidget {
  const MealListviewItem(this.meal, {super.key});

  final Meal meal;

  String toCapitalized(String text) {
    return text.replaceFirst(text[0], text[0].toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal)));
        },
        child: Stack(
          children: [
            SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.green[700],
                ),
              ),
            ),
            Hero(
              tag: meal.id,
              child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(milliseconds: 300),
                height: 250,
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MealItemInfo(
                              icon: Icons.schedule_outlined,
                              text: '${meal.duration} min',
                            ),
                            MealItemInfo(
                              icon: Icons.science_outlined,
                              text: toCapitalized(meal.complexity.name),
                            ),
                            MealItemInfo(
                              icon: Icons.attach_money,
                              text: toCapitalized(meal.affordability.name),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
