import 'package:flutter/material.dart';
import 'package:movie_app2/providers/movie_provider.dart';
import 'package:movie_app2/widgets/widgets.dart';


class MovieStack extends StatelessWidget {
  final int index;
  final MovieProvider provider;
  MovieStack(this.index,this.provider);

  @override
  Widget build(BuildContext context) {
    final newIndex = index;
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 20, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            offset: Offset(2.0, 2.0),
            blurRadius: 15.0,
          ),
        ],
        color: Colors.white10,
      ),
      child: Stack(
        children: <Widget>[
          // MOVIE DETAILS
          Positioned(
            child: MovieItem(newIndex,provider),
            left: 125,
            top: 55,
          ),
          //ENDING MOVIE DETAILS

          //Image Here
          ImageItem(newIndex,provider),
        ],
      ),
    );
  }
}