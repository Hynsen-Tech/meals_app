import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsPreparation extends StatelessWidget {
  const MealDetailsPreparation(this.steps, {super.key});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PREPARATION',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.orange, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              for (int index = 0; index < steps.length; index++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                '$index',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            steps[index],
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: index < steps.length - 1 ? 18 : 0,
                    ),
                    Container(
                      height: index < steps.length - 1 ? 0.3 : 0,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.grey),
                    )
                  ],
                ),
            ],
          ),
        ));
  }
}
