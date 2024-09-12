class Movie {
  final String title;
  final String backDropPath;
  //Add overview, posterPath, releaseDate
  final String overview;
  final String posterPath;
  final String releaseDate;

  Movie({
    required this.title,
    required this.backDropPath,
    // Add overview, posterPath, releaseDate
    required this.overview,
    required this.posterPath,
    required this.releaseDate, 
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      //Add overview, posterPath, releaseDate
      overview: map['overview'],     
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      // Add overview, posterPath, releaseDate.
      'overview': overview,     
      'posterPath': posterPath,
      'releaseDate': releaseDate,
    };
  }
}
