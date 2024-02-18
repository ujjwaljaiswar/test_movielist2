
import 'package:flutter/material.dart';
import 'package:test_movielist2/database_helper.dart';
import 'package:test_movielist2/movie_data.dart';
import 'display_movies_page.dart';

class AddMoviePage extends StatefulWidget {
  @override
  _AddMoviePageState createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  final dbHelper = DatabaseHelper();

  String selectedCinema = 'G7 Multiplex';
  String selectedGenre = 'Action';
  String selectedLanguage = 'English';
  String selectedFormat = '2D';
  TextEditingController movieNameEnglishController = TextEditingController();
  TextEditingController movieNameArabicController = TextEditingController();
  TextEditingController releaseDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController trailerLinkController = TextEditingController();
  bool showMoviePageBanner = false;
  bool showRecommendedMovies = false;
  bool showPromotionalMovies = false;
  bool showWhatsOnMovies = false;
  bool showComingSoonMovies = false;
  bool showMovieCrewSection = false;
  TextEditingController crewNameEnglishController = TextEditingController();
  TextEditingController crewNameArabicController = TextEditingController();
  TextEditingController crewRolePlayEnglishController = TextEditingController();
  TextEditingController crewRolePlayArabicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Cinema:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              DropdownButton<String>(
                value: selectedCinema,
                onChanged: (value) {
                  setState(() {
                    selectedCinema = value!;
                  });
                },
                items: ['G7 Multiplex', 'Maison PVR']
                    .map((cinema) => DropdownMenuItem(
                  value: cinema,
                  child: Text(cinema),
                ))
                    .toList(),
              ),
              SizedBox(height: 15.0),
              Text(
                'Movie Name (English):',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: movieNameEnglishController,
                decoration: InputDecoration(
                  hintText: 'Enter movie name in English',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Text(
                'Movie Name (Arabic):',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: movieNameArabicController,
                decoration: InputDecoration(
                  hintText: 'Enter movie name in Arabic',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Text(
                'Release Date:',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: releaseDateController,
                decoration: InputDecoration(
                  hintText: 'Enter Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Text(
                'Tentative End Date:',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: endDateController,
                decoration: InputDecoration(
                  hintText: 'Enter Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Text(
                'Select Genre:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              DropdownButton<String>(
                value: selectedGenre,
                onChanged: (value) {
                  setState(() {
                    selectedGenre = value!;
                  });
                },
                items: ['Action', 'Adventure', 'Romance']
                    .map((genre) => DropdownMenuItem(
                  value: genre,
                  child: Text(genre),
                ))
                    .toList(),
              ),

              SizedBox(height: 10.0),

              Text(
                'Select Language:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
                items: ['English', 'Arabic', 'Hindi']
                    .map((language) => DropdownMenuItem(
                  value: language,
                  child: Text(language),
                ))
                    .toList(),
              ),

              SizedBox(height: 10.0),

              Text(
                'Select Format:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              DropdownButton<String>(
                value: selectedFormat,
                onChanged: (value) {
                  setState(() {
                    selectedFormat = value!;
                  });
                },
                items: ['2D', '3D']
                    .map((format) => DropdownMenuItem(
                  value: format,
                  child: Text(format),
                ))
                    .toList(),
              ),

              SizedBox(height: 20.0),

              Text(
                'Other Details:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),

              Text(
                'Rating (1-5):',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter movie rating (1-5)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Text(
                'Trailer Video Link:',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: trailerLinkController,
                decoration: InputDecoration(
                  hintText: 'Enter trailer video link',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),

              Row(
                children: [
                  Checkbox(
                    value: showMoviePageBanner,
                    onChanged: (value) {
                      setState(() {
                        showMoviePageBanner = value!;
                      });
                    },
                  ),
                  Text(
                    'Show Movie Page Banner',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),

              SizedBox(height: 10.0),

              Text(
                'Movie Type:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Checkbox(
                    value: showWhatsOnMovies,
                    onChanged: (value) {
                      setState(() {
                        showWhatsOnMovies = value!;
                      });
                    },
                  ),
                  Text(
                    'What\'s On',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: showComingSoonMovies,
                    onChanged: (value) {
                      setState(() {
                        showComingSoonMovies = value!;
                      });
                    },
                  ),
                  Text(
                    'Coming Soon',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: showRecommendedMovies,
                    onChanged: (value) {
                      setState(() {
                        showRecommendedMovies = value!;
                      });
                    },
                  ),
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: showPromotionalMovies,
                    onChanged: (value) {
                      setState(() {
                        showPromotionalMovies = value!;
                      });
                    },
                  ),
                  Text(
                    'Promotional',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Movie Crew:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                    icon: Icon(
                      showMovieCrewSection
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onPressed: () {
                      setState(() {
                        showMovieCrewSection = !showMovieCrewSection;
                      });
                    },
                  ),
                ],
              ),

              if (showMovieCrewSection)
                Column(
                  children: [
                    Text(
                      'Name in English:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: crewNameEnglishController,
                      decoration: InputDecoration(
                        hintText: 'Enter name in English',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Text(
                      'Name in Arabic:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: crewNameArabicController,
                      decoration: InputDecoration(
                        hintText: 'Enter name in Arabic',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Text(
                      'crew member in English:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: crewRolePlayEnglishController,
                      decoration: InputDecoration(
                        hintText: 'Enter crew member in English',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Text(
                      'crew member in Arabic:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: crewRolePlayArabicController,
                      decoration: InputDecoration(
                        hintText: 'Enter crew member in Arabic',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),

              ElevatedButton(
                onPressed: () async {
                  await dbHelper.insertMovie(
                    MovieData(
                      cinema: selectedCinema,
                      movieNameEnglish: movieNameEnglishController.text,
                      movieNameArabic: movieNameArabicController.text,
                      releaseDate: releaseDateController.text,
                      endDate: endDateController.text,
                      genre: selectedGenre,
                      language: selectedLanguage,
                      format: selectedFormat,
                      rating: double.parse(ratingController.text),
                      trailerLink: trailerLinkController.text,
                      showMoviePageBanner: showMoviePageBanner,
                      showWhatsOnMovies: showWhatsOnMovies,
                      showComingSoonMovies: showComingSoonMovies,
                      showRecommendedMovies: showRecommendedMovies,
                      showPromotionalMovies: showPromotionalMovies,
                    ),
                  );

                  movieNameEnglishController.clear();
                  movieNameArabicController.clear();
                  releaseDateController.clear();
                  endDateController.clear();
                  ratingController.clear();
                  trailerLinkController.clear();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayMoviesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
