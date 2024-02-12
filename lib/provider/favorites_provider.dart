import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealNotifier() : super([]);

  void toggleMealFavoritesStatus(Meal meal) {
    final isMealFavorites = state.contains(meal);

    if (isMealFavorites) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealProvider = StateNotifierProvider<FavoritesMealNotifier,List<Meal>>((ref) {
  return FavoritesMealNotifier();
});

