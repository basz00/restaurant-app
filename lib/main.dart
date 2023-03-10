import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant/details_page.dart';
import 'package:restaurant_app/restaurant/model/restaurants.dart';
import 'package:restaurant_app/restaurant/overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: OverviewPage.routeName,
      routes: {
        OverviewPage.routeName: (context) => const OverviewPage(),
        DetailsPage.routeName: (context) => DetailsPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
