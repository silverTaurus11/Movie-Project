class DbSchema {
  static const createMovies = '''
  CREATE TABLE movies (
    id INTEGER NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    overview TEXT NOT NULL,
    poster_path TEXT NOT NULL,
    backdrop_path TEXT NOT NULL,
    release_date TEXT NOT NULL,
    runtime INTEGER NOT NULL,
    vote_average REAL NOT NULL,
    tagline TEXT NOT NULL,
    genres TEXT NOT NULL,
    adult INTEGER NOT NULL,
    original_language TEXT NOT NULL,
    updated_at INTEGER NOT NULL
  );
  ''';

  static const createMovieCast = '''
  CREATE TABLE movie_cast (
    id INTEGER PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    character TEXT NOT NULL,
    profile_path TEXT NOT NULL
  );
  ''';

  static const createMovieVideos = '''
  CREATE TABLE movie_videos (
    id TEXT PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    key TEXT NOT NULL,
    site TEXT NOT NULL,
    type TEXT NOT NULL,
    official INTEGER NOT NULL
  );
  ''';
}
