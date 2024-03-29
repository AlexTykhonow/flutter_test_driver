import 'package:flutter/material.dart';
import 'package:flutter_test_driver/screens/favorites.dart';
import 'package:flutter_test_driver/screens/fields.dart';
import 'package:flutter_test_driver/screens/home.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
          FieldsPage.routeName: (context) => FieldsPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}