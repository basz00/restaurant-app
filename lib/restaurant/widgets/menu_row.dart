import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant/model/restaurants.dart';

class MenuRow extends StatelessWidget {
  final Menus menus;

  const MenuRow({Key? key, required this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Foods",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildFoods(menus.foods),
        SizedBox(
          height: 16,
        ),
        Text("Drinks",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildDrinks(menus.drinks)
      ],
    );
  }
}

Widget _buildFoods(List<Food> foods) {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: foods.map((food) {
        return _buildItem(food.name);
      }).toList(),
    ),
  );
}

Widget _buildDrinks(List<Drink> drinks) {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: drinks.map((drink) {
        return _buildItem(drink.name);
      }).toList(),
    ),
  );
}

Widget _buildItem(String name) {
  return SizedBox(
    width: 150,
    height: 50,
    child: Card(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(4),
              width: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10),
                      bottomEnd: Radius.circular(10))),
              child: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
