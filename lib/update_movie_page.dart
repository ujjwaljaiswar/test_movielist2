import 'package:flutter/material.dart';
import 'package:test_movielist2/movie_data.dart';

class UpdateMoviePage extends StatefulWidget {
  final MovieData movie;

  UpdateMoviePage({required this.movie});

  @override
  _UpdateMoviePageState createState() => _UpdateMoviePageState();
}

class _UpdateMoviePageState extends State<UpdateMoviePage> {
  late TextEditingController movieNameController;
  late TextEditingController ratingController;

  @override
  void initState() {
    super.initState();
    movieNameController = TextEditingController(text: widget.movie.movieNameEnglish);
    ratingController = TextEditingController(text: widget.movie.rating.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Movie'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Movie Name (English):',
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: movieNameController,
              decoration: InputDecoration(
                hintText: 'Enter movie name in English',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),

            Text(
              'Rating:',
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter movie rating',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                // Perform the update operation here
                // You can use widget.movie.id to get the movie ID
                // Update the database and notify the calling page
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
