import 'package:flutter/material.dart';

import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/mealdetails.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.ontoggleFavorites
  });

    final void Function(Meal meals) ontoggleFavorites;
  final String? title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal) {
    // Navigator.pop(context); this when to delete a screen whan a botton is press
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailScreen(meals: meal ,ontoggleFavorites: ontoggleFavorites)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
      
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (context, meal) {
              selectMeal(context, meal);
            }),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        
      ),
      body: content,
    );
  }
}
