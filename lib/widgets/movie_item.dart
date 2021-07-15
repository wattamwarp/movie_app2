import 'package:flutter/material.dart';
import 'package:movie_app2/constants/colors.dart';
import 'package:movie_app2/providers/movie_provider.dart';


class MovieItem extends StatelessWidget {
  final MovieProvider provider;
  final int index;
  MovieItem(this.index, this.provider);

  @override
  Widget build(BuildContext context) {
    final result = provider.movies[index];
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 140,
      width: width - 160,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 2.0),
            blurRadius: 20.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              result.title ?? "",
              style: Theme.of(context).textTheme.headline6,
              softWrap: true,
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              height: 25,
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx, ind) {
                  return Text(
                    "${result.originalTitle ?? ""}",
                    softWrap: false,
                    overflow: TextOverflow.clip,
                  );
                },
              ),
            ),
            Container(
              height: 35,
              width: 90,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    result.voteAverage.toString() ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                color: double.parse(result.voteAverage.toString()) <= 7.0 ? TColors.blue : TColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
