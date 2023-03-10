import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant/model/restaurants.dart';

class MenuRow extends StatelessWidget {
  final Menus menus;

  const MenuRow({Key? key, required this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildFoods(menus.foods), _buildDrinks(menus.drinks)],
    );
  }
}

Widget _buildFoods(List<Food> foods) {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: foods.map((food) {
        return Container(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(food.name),
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildDrinks(List<Drink> drinks) {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: drinks.map((food) {
        return Container(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(food.name),
          ),
        );
      }).toList(),
    ),
  );
}
