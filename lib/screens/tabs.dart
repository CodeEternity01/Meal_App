import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/provider/meals_provider.dart';
import 'package:meal_app/provider/favorites_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

 
  Map<Filter, bool> _selectedFilter = kInitialFilter;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);

    if (identifier == 'Filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (cxt) => FilterScreen(
                    currentFilter: _selectedFilter,
                  )));
      setState(() {
        _selectedFilter = result ?? kInitialFilter;
      });
    } else if (identifier == 'Favorites') {
      // here it an issue to solve that when ever favorites clicked by drawer than screen got stack
      final favoritesMeals = ref.watch(favoriteMealProvider);
      Navigator.of(context).push(MaterialPageRoute(
          barrierDismissible: true,
  
          builder: (cxt) => MealsScreen(
              meals: favoritesMeals,
          )));
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableM = meals.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      avialableM: availableM,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealProvider);
      activePage = MealsScreen(
        meals: favoritesMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorities'),
        ],
      ),
    );
  }
}
