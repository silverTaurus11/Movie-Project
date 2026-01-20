package com.gayuh.movies.core.remote.dto

import com.gayuh.movies.core.database.entity.MovieEntity
import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class MovieModel(
    @Json(name = "id")
    val id: Int,

    @Json(name = "title")
    val title: String = "",

    @Json(name = "overview")
    val overview: String = "",

    @Json(name = "poster_path")
    val posterPath: String = "",

    @Json(name = "backdrop_path")
    val backdropPath: String = "",

    @Json(name = "release_date")
    val releaseDate: String = "",

    @Json(name = "runtime")
    val runtime: Int = 0,

    @Json(name = "vote_average")
    val voteAverage: Double = 0.0,

    @Json(name = "tagline")
    val tagline: String = "",

    @Json(name = "genres")
    val genres: List<GenreDto> = emptyList(),

    @Json(name = "adult")
    val adult: Boolean = false,

    @Json(name = "original_language")
    val originalLanguage: String = ""
) {
    companion object {
        fun MovieModel.toEntity(): MovieEntity =
            MovieEntity(
                id = id,
                title = title,
                overview = overview,
                posterPath = posterPath,
                backdropPath = backdropPath,
                releaseDate = releaseDate,
                runtime = runtime,
                voteAverage = voteAverage,
                tagline = tagline,
                genres = genres.joinToString(
                    prefix = "[",
                    postfix = "]"
                ) { "\"${it.name}\"" },
                adult = if (adult) 1 else 0,
                originalLanguage = originalLanguage,
                updatedAt = System.currentTimeMillis()
            )
    }
}
