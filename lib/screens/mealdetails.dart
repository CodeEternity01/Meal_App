import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meals});

  final Meal meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesMeals = ref.watch(favoriteMealProvider);
    final isFavorites = favoritesMeals.contains(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasadded = ref
                    .read(favoriteMealProvider.notifier)
                    .toggleMealFavoritesStatus(meals);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasadded
                        ? 'Meal added as a favorites. '
                        : 'Meal removed..')));
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.9,end: 1.0).animate(animation),
                    child: child,);
                },
                child: Icon(isFavorites ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorites),),
              ))
        ],
      ),
      body: SingleChildScrollView(
        // In list view the aligment is not cnetered whereasin singlechildschollview have all dafault center aligent
        child: Column(
          children: [
            Hero(
              tag: meals.id,
              child: Image.network(meals.imageUrl,
                  width: double.infinity, height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingrident',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingrident in meals.ingredients)
              Text(
                ingrident,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meals.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  step,
                  // textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
