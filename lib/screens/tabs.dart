import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favorites = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoritieStatus(Meal meal) {
    final isExisting = _favorites.contains(meal);

    if (isExisting == true) {
      setState(() {
        _favorites.remove(meal);
      });
      _showInfoMessage('Meal is no longer Favorites');
    } else {
      setState(() {
        _favorites.add(meal);
      });
      _showInfoMessage('Meal is Favorites');
    }
  }

  void _setScreen(String identifier) {
    
      Navigator.pop(context);
    
     if (identifier == 'Filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (cxt) =>const FilterScreen()));
    } else if (identifier == 'Favorites') {
      // here it an issue to solve that when ever favorites clicked by drawer than screen got stack
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          barrierDismissible: true,
          builder: (cxt) => MealsScreen(
              meals: _favorites,
              ontoggleFavorites: _toggleMealFavoritieStatus)));
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      ontoggleFavorites: _toggleMealFavoritieStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favorites,
        ontoggleFavorites: _toggleMealFavoritieStatus,
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
