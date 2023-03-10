import 'package:flutter/material.dart';
import 'package:restaurant_app/common/ui/rating.dart';

import 'model/restaurants.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details_page';
  final Restaurant restaurant;

  const DetailsPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
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
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(restaurant.city),
                  const SizedBox(height: 10),
                  Rating(rating: restaurant.rating),
                  const SizedBox(height: 20),
                  Text(restaurant.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
