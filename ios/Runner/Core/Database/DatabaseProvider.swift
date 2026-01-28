import Foundation
import SQLite3

final class DatabaseProvider {

  static let shared = DatabaseProvider()
  private(set) var db: OpaquePointer?

  private init() {
    openDatabase()
  }

  private func openDatabase() {
    let fileURL = FileManager.default
      .urls(for: .documentDirectory, in: .userDomainMask)
      .first!
      .appendingPathComponent("movies.db")

    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
      fatalError("Unable to open database")
    }
  }
}
