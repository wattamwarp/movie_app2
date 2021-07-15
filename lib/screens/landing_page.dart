import 'package:flutter/material.dart';
import 'package:movie_app2/providers/movie_provider.dart';
import 'package:movie_app2/widgets/search_bar.dart';
import 'package:movie_app2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _movies = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SearchBar(
                  provider: _movies,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  child: _movies.isLoading 
                      ? Center(
                          child: Text(
                          "No Reults Yet",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : ListView.builder(
                          itemCount: _movies.movies.length,
                          itemBuilder: (ctx, index) {
                            return MovieStack(index, _movies);
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
