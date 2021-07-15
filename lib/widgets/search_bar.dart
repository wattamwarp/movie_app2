import 'package:flutter/material.dart';
import 'package:movie_app2/providers/movie_provider.dart';

class SearchBar extends StatelessWidget {
  final _searchController = TextEditingController();
  final MovieProvider provider;

  SearchBar({ Key key,  this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      child: TextField(
        cursorColor: Colors.black,
        autofocus: true,
        autocorrect: false,
        // style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          // alignLabelWithHint: true,
          hintText: 'Search for movies',
          hintStyle: Theme.of(context).textTheme.headline6,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        // controller: _searchController,
        // onSubmitted: (value) {},
        onChanged: (value) {
          provider.getMovieResult(value);
        },
      ),
    );
  }
}
