import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsPreparation extends StatelessWidget {
  const MealDetailsPreparation(this.steps, {super.key});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 600,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PREPARATION',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  for (int index = 0; index < steps.length; index++)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.green),
                              ),
                              Expanded(
                                child: Text(
                                  steps[index],
                                  style: const TextStyle(fontSize: 18),
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
                    ),
                ],
              ),
            )),
      ],
    );
  }
}
