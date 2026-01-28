import Foundation
import SQLite3

final class MovieLocalDataSourceImpl {

  private let db: OpaquePointer?

  init(db: DatabaseProvider) {
    self.db = db.db
  }

  // MARK: - Movie

  func saveMovie(_ movie: Movie) {
    let sql = """
      INSERT OR REPLACE INTO movies
      (id, title, overview, poster_path, release_date, vote_average)
      VALUES (?, ?, ?, ?, ?, ?);
    """

    var stmt: OpaquePointer?
    guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
      return
    }
    defer { sqlite3_finalize(stmt) }

    sqlite3_bind_int(stmt, 1, Int32(movie.id))
    sqlite3_bind_text(stmt, 2, movie.title, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(stmt, 3, movie.overview, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(stmt, 4, movie.posterPath, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(stmt, 5, movie.releaseDate, -1, SQLITE_TRANSIENT)
    sqlite3_bind_double(stmt, 6, movie.voteAverage)

    sqlite3_step(stmt)
  }

  // MARK: - Cast

  func saveCast(_ cast: [Cast], movieId: Int) {
    deleteCast(movieId: movieId)

    let sql = """
      INSERT INTO movie_cast
      (id, movie_id, name, character, profile_path)
      VALUES (?, ?, ?, ?, ?);
    """

    var stmt: OpaquePointer?
    guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
      return
    }
    defer { sqlite3_finalize(stmt) }

    for item in cast {
      sqlite3_bind_int(stmt, 1, Int32(item.id))
      sqlite3_bind_int(stmt, 2, Int32(movieId))
      sqlite3_bind_text(stmt, 3, item.name, -1, SQLITE_TRANSIENT)
      sqlite3_bind_text(stmt, 4, item.character, -1, SQLITE_TRANSIENT)
      sqlite3_bind_text(stmt, 5, item.profilePath, -1, SQLITE_TRANSIENT)

      sqlite3_step(stmt)
      sqlite3_reset(stmt)
    }
  }

  private func deleteCast(movieId: Int) {
    let sql = "DELETE FROM movie_cast WHERE movie_id = ?;"
    var stmt: OpaquePointer?

    guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
      return
    }
    defer { sqlite3_finalize(stmt) }

    sqlite3_bind_int(stmt, 1, Int32(movieId))
    sqlite3_step(stmt)
  }

  // MARK: - Videos

  func saveVideos(_ videos: [MovieVideo], movieId: Int) {
    deleteVideos(movieId: movieId)

    let sql = """
      INSERT INTO movie_videos
      (id, movie_id, name, key, site, type, official)
      VALUES (?, ?, ?, ?, ?, ?, ?);
    """

    var stmt: OpaquePointer?
    guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
      return
    }
    defer { sqlite3_finalize(stmt) }

    for video in videos {
      sqlite3_bind_text(stmt, 1, video.id, -1, SQLITE_TRANSIENT)
      sqlite3_bind_int(stmt, 2, Int32(movieId))
      sqlite3_bind_text(stmt, 3, video.name, -1, SQLITE_TRANSIENT)
      sqlite3_bind_text(stmt, 4, video.key, -1, SQLITE_TRANSIENT)
      sqlite3_bind_text(stmt, 5, video.site, -1, SQLITE_TRANSIENT)
      sqlite3_bind_text(stmt, 6, video.type, -1, SQLITE_TRANSIENT)
      sqlite3_bind_int(stmt, 7, video.official ? 1 : 0)

      sqlite3_step(stmt)
      sqlite3_reset(stmt)
    }
  }

  private func deleteVideos(movieId: Int) {
    let sql = "DELETE FROM movie_videos WHERE movie_id = ?;"
    var stmt: OpaquePointer?

    guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
      return
    }
    defer { sqlite3_finalize(stmt) }

    sqlite3_bind_int(stmt, 1, Int32(movieId))
    sqlite3_step(stmt)
  }
    
  private let SQLITE_TRANSIENT = unsafeBitCast(
    -1,
    to: sqlite3_destructor_type.self
  )

}
