import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/categories_grid_item.dart';
import 'package:meal_app/model/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.ontoggleFavorites});

    final void Function(Meal meals) ontoggleFavorites;
  void _selectCategory(BuildContext context, Category category) {
   final filteredMeals= avialableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Navigator(context,route);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (cxt) =>
             MealsScreen(title: category.title, meals: filteredMeals,ontoggleFavorites: ontoggleFavorites,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context,category);
              },
            )
        ],
    );
  }
}
