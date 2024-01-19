import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
 
    
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
     Widget content=ListView.builder(
    
         shrinkWrap: true,
        itemCount: meals.length,
        itemBuilder: ((context, index) {
          return MealItem(meal: meals[index]);
        }));

      if(meals.isEmpty){
        content=Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Text('Uh oh... Nothing here',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,),),
          const SizedBox(height: 16),
          Text('Try something different category!',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),),

        ],),);
      }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      
      );
  }
}
