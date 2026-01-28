enum MovieMapper {

  static func movie(_ dto: MovieDto) -> Movie {
    Movie(
      id: dto.id,
      title: dto.title,
      overview: dto.overview,
      posterPath: dto.poster_path ?? "",
      releaseDate: dto.release_date ?? "",
      voteAverage: dto.vote_average
    )
  }

  static func cast(_ dto: [CastDto]) -> [Cast] {
    dto.map {
      Cast(
        id: $0.id,
        name: $0.name,
        character: $0.character,
        profilePath: $0.profile_path ?? ""
      )
    }
  }

  static func videos(_ dto: [VideoDto]) -> [MovieVideo] {
    dto.map {
      MovieVideo(
        id: $0.id,
        name: $0.name,
        key: $0.key,
        site: $0.site,
        type: $0.type,
        official: $0.official
      )
    }
  }
}
