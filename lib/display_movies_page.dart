// display_movies_page.dart

import 'package:flutter/material.dart';
import 'package:test_movielist2/database_helper.dart';
import 'package:test_movielist2/movie_data.dart';

class DisplayMoviesPage extends StatelessWidget {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Movies'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<MovieData>>(
        future: dbHelper.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No movies available.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return ListTile(
                  title: Text(movie.movieNameEnglish),
                  subtitle: Text('Cinema: ${movie.cinema}, Genre: ${movie.genre}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
