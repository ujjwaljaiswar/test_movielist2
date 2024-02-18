import 'package:flutter/material.dart';
import 'package:test_movielist2/database_helper.dart';
import 'package:test_movielist2/movie_data.dart';
import 'package:test_movielist2/update_movie_page.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final dbHelper = DatabaseHelper();
  List<MovieData>? movieList; // Make sure it's nullable

  @override
  void initState() {
    super.initState();
    refreshMovieList();
  }

  void refreshMovieList() async {
    final list = await dbHelper.getMovies();
    setState(() {
      movieList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        backgroundColor: Colors.purple,
      ),
      body: movieList == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: movieList!.length,
        itemBuilder: (context, index) {
          final movie = movieList![index];
          return ListTile(
            title: Text(movie.movieNameEnglish),
            subtitle: Text('Rating: ${movie.rating}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateMoviePage(movie: movie),
                      ),
                    );

                    if (result == true) {
                      refreshMovieList();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await dbHelper.deleteMovie(movie.id!);
                    refreshMovieList();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
