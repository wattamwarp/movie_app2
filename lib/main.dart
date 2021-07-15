import 'package:flutter/material.dart';
import 'package:movie_app2/providers/movie_provider.dart';
import 'package:movie_app2/screens/landing_page.dart';
import 'package:movie_app2/service/search_movies.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          MovieProvider(searchMoviesService: new SearchMoviesService()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
