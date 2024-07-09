import 'package:flutter/material.dart';
import 'package:image_searcher/presentaion/viewmodels/favorite_view_model.dart';
import 'package:provider/provider.dart';
import 'package:image_searcher/presentaion/modules/di.dart';
import 'package:image_searcher/presentaion/viewmodels/search_view_model.dart';
import 'package:image_searcher/presentaion/views/main/main_view.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => locator<SearchViewModel>()),
          ChangeNotifierProvider(
              create: (_) => locator<FavoriteViewModel>()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MainView(),
        ),
    );
  }
}