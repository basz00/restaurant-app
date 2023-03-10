import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant/details_page.dart';
import 'package:restaurant_app/restaurant/model/restaurants.dart';
import 'package:restaurant_app/restaurant/widgets/restaurant_list_item.dart';

class OverviewPage extends StatelessWidget {
  static const routeName = '/overview_page';

  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildList(context)],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Restaurant',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Restaurant recommendations for you!',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurants.json'),
      builder: (context, snapshot) {
        final restaurants = parseRestaurants(snapshot.data);
        return Expanded(
          child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return RestaurantListItem(
                    key: Key(restaurant.id),
                    restaurant: restaurant,
                    onTapAction: () => {
                          Navigator.pushNamed(context, DetailsPage.routeName,
                              arguments: restaurant)
                        });
              }),
        );
      },
    );
  }
}
