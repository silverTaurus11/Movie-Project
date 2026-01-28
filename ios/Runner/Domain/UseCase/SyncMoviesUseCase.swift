final class SyncMoviesUseCase {

  private let repository: MovieSyncRepository

  init(repository: MovieSyncRepository) {
    self.repository = repository
  }

  func execute() async throws {
    try await repository.syncTopRated()
  }
}
