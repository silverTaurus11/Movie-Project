final class SyncBootstrap {

  static func startIfNeeded() {

    Task.detached {
      do {
        let api = MovieApiClient()
        let remote = MovieRemoteDataSourceImpl(api: api)
        let local = MovieLocalDataSourceImpl(db: .shared)
        let repo = MovieSyncRepositoryImpl(remote: remote, local: local)
        let useCase = SyncMoviesUseCase(repository: repo)

        try await useCase.execute()
        SyncEventEmitter.shared.notifyFirstSyncDone()

      } catch {
        // swallow or log
          print("❌ Failed to pretty print JSON:", error)

      }
    }
  }
}
