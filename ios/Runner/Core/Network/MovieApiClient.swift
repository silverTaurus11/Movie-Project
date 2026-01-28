final class MovieApiClient {

  private let baseUrl = "https://api.themoviedb.org/3"
  private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYmZhNTE1MmFkZDEwZTdhYzY4YmI2OTI0NDE2Y2YzYyIsIm5iZiI6MTc2NjAyODU3OS4wMTMsInN1YiI6IjY5NDM3NTIzMjY5NTdhZjgwMzM4YmJjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zGI4zPH35g1D8bdh9cfd9gGNqhD0yFJRALz2rrsIZtc"

  func get(path: String, query: [String: String] = [:]) async throws -> Data {
    var components = URLComponents(string: baseUrl + path)!
    components.queryItems = query.map {
      URLQueryItem(name: $0.key, value: $0.value)
    }

    var request = URLRequest(url: components.url!)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    let (data, _) = try await URLSession.shared.data(for: request)
    return data
  }
}
