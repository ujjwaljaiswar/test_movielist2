class MovieData {
  int? id;
  String cinema;
  String movieNameEnglish;
  String movieNameArabic;
  String releaseDate;
  String endDate;
  String genre;
  String language;
  String format;
  double rating;
  String trailerLink;
  bool showMoviePageBanner;
  bool showWhatsOnMovies;
  bool showComingSoonMovies;
  bool showRecommendedMovies;
  bool showPromotionalMovies;

  MovieData({
    this.id,
    required this.cinema,
    required this.movieNameEnglish,
    required this.movieNameArabic,
    required this.releaseDate,
    required this.endDate,
    required this.genre,
    required this.language,
    required this.format,
    required this.rating,
    required this.trailerLink,
    required this.showMoviePageBanner,
    required this.showWhatsOnMovies,
    required this.showComingSoonMovies,
    required this.showRecommendedMovies,
    required this.showPromotionalMovies,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cinema': cinema,
      'movieNameEnglish': movieNameEnglish,
      'movieNameArabic': movieNameArabic,
      'releaseDate': releaseDate,
      'endDate': endDate,
      'genre': genre,
      'language': language,
      'format': format,
      'rating': rating,
      'trailerLink': trailerLink,
      'showMoviePageBanner': showMoviePageBanner ? 1 : 0,
      'showWhatsOnMovies': showWhatsOnMovies ? 1 : 0,
      'showComingSoonMovies': showComingSoonMovies ? 1 : 0,
      'showRecommendedMovies': showRecommendedMovies ? 1 : 0,
      'showPromotionalMovies': showPromotionalMovies ? 1 : 0,
    };
  }

  factory MovieData.fromMap(Map<String, dynamic> map) {
    return MovieData(
      id: map['id'],
      cinema: map['cinema'],
      movieNameEnglish: map['movieNameEnglish'],
      movieNameArabic: map['movieNameArabic'],
      releaseDate: map['releaseDate'],
      endDate: map['endDate'],
      genre: map['genre'],
      language: map['language'],
      format: map['format'],
      rating: map['rating'],
      trailerLink: map['trailerLink'],
      showMoviePageBanner: map['showMoviePageBanner'] == 1,
      showWhatsOnMovies: map['showWhatsOnMovies'] == 1,
      showComingSoonMovies: map['showComingSoonMovies'] == 1,
      showRecommendedMovies: map['showRecommendedMovies'] == 1,
      showPromotionalMovies: map['showPromotionalMovies'] == 1,
    );
  }
}
