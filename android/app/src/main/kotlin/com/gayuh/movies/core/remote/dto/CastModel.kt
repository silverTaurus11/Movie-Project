package com.gayuh.movies.core.remote.dto

import com.gayuh.movies.core.database.entity.MovieCastEntity
import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class CastModel(
    @Json(name = "id")
    val id: Int,

    @Json(name = "name")
    val name: String,

    @Json(name = "character")
    val character: String,

    @Json(name = "profile_path")
    val profilePath: String?
) {
    companion object {
        fun CastModel.toEntity(movieId: Int): MovieCastEntity =
            MovieCastEntity(
                id = id,
                movieId = movieId,
                name = name,
                character = character,
                profilePath = profilePath ?: ""
            )

    }
}
