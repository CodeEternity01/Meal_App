import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  // void _switchtoMain(BuildContext context) {
  //   // Navigator(context,route);
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (cxt) => CategoriesScreen(
  //             ontoggleFavorites: ontoggleFavorites,
  //           )));
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.9),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood,
                      size: 48, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 18),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text('Meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text('Filters',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
            onTap: () {
              onSelectScreen('Filters');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.onBackground,
              size: 26,
            ),
            title: Text('Favorites',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
            onTap: () {
              onSelectScreen('Favorites');
            },
          )
        ],
      ),
    );
  }
}
