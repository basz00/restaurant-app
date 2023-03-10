import 'package:flutter/material.dart';
import 'package:restaurant_app/common/ui/rating.dart';
import 'package:restaurant_app/restaurant/model/restaurants.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;
  final Function onTapAction;

  const RestaurantListItem(
      {Key? key, required this.restaurant, required this.onTapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            onTapAction();
          },
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(restaurant.name),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.city),
                  Rating(rating: restaurant.rating)
                ]),
            isThreeLine: true,
            leading: SizedBox(
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    restaurant.pictureId,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'Problem with loading image',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                    fit: BoxFit.fill,
                  )),
            ),
          )),
    );
  }
}
