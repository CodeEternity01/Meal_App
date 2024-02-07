import 'package:flutter/material.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluteenFreeFliterSet = false;
  var _fatFreeFliterSet=false;
   var _lactosFreeFliterSet = false;
  var _vegitarianFreeFliterSet=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // As if we usedrawer the back bottom disapear from filter so we are happy with back botton
      // drawer: MainDrawer(onSelectScreen: ((identifier) {
      //   Navigator.pop(context);
      //   if (identifier == 'meals') {
      //     // there is pushreplacemt also which changes the page 
      //     Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>const TabsScreen())));
      //   }
      // })),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluteenFreeFliterSet,
            onChanged: (isChecked) {
              setState(() {
                _gluteenFreeFliterSet = isChecked;
              });
            },
            title: Text(
              'Gluteen-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include the Glutten Free Meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: _fatFreeFliterSet,
            onChanged: (isChecked) {
              setState(() {
                _fatFreeFliterSet = isChecked;
              });
            },
            title: Text(
              'Fat-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include the Fat Free Meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: _lactosFreeFliterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactosFreeFliterSet = isChecked;
              });
            },
            title: Text(
              'Lactos-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include the Lactos Free Meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: _vegitarianFreeFliterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegitarianFreeFliterSet = isChecked;
              });
            },
            title: Text(
              'Vegitarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include the vegan and veg Meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          )
        ],
      ),
    );
  }
}
