import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app2/providers/movie_provider.dart';


class ImageItem extends StatelessWidget {
  final int index;
  final MovieProvider provider;
  ImageItem(this.index, this.provider);

  Widget build(BuildContext context) {
    log(provider.movies[index].backdropPath.toString());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
        // color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          height: 185,
          width: 135,
          image:
              //   ?
              provider.movies[index].posterPath != null
                  ? NetworkImage(
                      "http://image.tmdb.org/t/p/w185/${provider.movies[index].posterPath}")
                  : NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png"),
          //   :
          // NetworkImage(
          //     "http://image.tmdb.org/t/p/w185/${imageUrl}",
          //   ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
