final class MovieSyncRepositoryImpl: MovieSyncRepository {

  private let remote: MovieRemoteDataSourceImpl
  private let local: MovieLocalDataSourceImpl

  init(remote: MovieRemoteDataSourceImpl, local: MovieLocalDataSourceImpl) {
    self.remote = remote
    self.local = local
  }

  func syncTopRated() async throws {

    let movies = try await remote.fetchTopRated(page: 1)

    for item in movies {

      let detail = try await remote.fetchDetail(id: item.id)
      let cast = try await remote.fetchCast(id: item.id)
      let videos = try await remote.fetchVideos(id: item.id)

      local.saveMovie(MovieMapper.movie(detail))
      local.saveCast(MovieMapper.cast(cast), movieId: detail.id)
      local.saveVideos(MovieMapper.videos(videos), movieId: detail.id)
    }
  }
}
