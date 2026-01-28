final class MovieRemoteDataSourceImpl {

  private let api: MovieApiClient
  private let decoder = JSONDecoder()

  init(api: MovieApiClient) {
    self.api = api
  }

  func fetchTopRated(page: Int) async throws -> [MovieDto] {
    let data = try await api.get(
      path: "/movie/top_rated",
      query: ["page": "\(page)", "language": "en-US"]
    )

   #if DEBUG
   if let json = String(data: data, encoding: .utf8) {
     print("📦 /movie/top_rated RESPONSE:\n\(json)")
   }
   #endif
      
    let root = try decoder.decode([String: [MovieDto]].self, from: data)
    return root["results"] ?? []
  }

  func fetchDetail(id: Int) async throws -> MovieDto {
    let data = try await api.get(path: "/movie/\(id)")
    return try decoder.decode(MovieDto.self, from: data)
  }

  func fetchCast(id: Int) async throws -> [CastDto] {
    let data = try await api.get(path: "/movie/\(id)/credits")
    let root = try decoder.decode([String: [CastDto]].self, from: data)
    return root["cast"] ?? []
  }

  func fetchVideos(id: Int) async throws -> [VideoDto] {
    let data = try await api.get(path: "/movie/\(id)/videos")
    let root = try decoder.decode([String: [VideoDto]].self, from: data)
    return root["results"] ?? []
  }
}
