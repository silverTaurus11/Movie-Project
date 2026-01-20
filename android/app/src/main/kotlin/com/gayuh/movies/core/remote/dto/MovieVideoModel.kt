package com.gayuh.movies.core.remote.dto

import com.gayuh.movies.core.database.entity.MovieVideoEntity
import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class MovieVideoModel(
    @Json(name = "id")
    val id: String,

    @Json(name = "name")
    val name: String,

    @Json(name = "key")
    val key: String,

    @Json(name = "site")
    val site: String,

    @Json(name = "type")
    val type: String,

    @Json(name = "official")
    val official: Boolean
) {
    companion object {
        fun MovieVideoModel.toEntity(movieId: Int): MovieVideoEntity =
            MovieVideoEntity(
                id = id,
                movieId = movieId,
                name = name,
                key = key,
                site = site,
                type = type,
                official = if (official) 1 else 0
            )
    }

    val isYoutube: Boolean
        get() = site.equals("youtube", ignoreCase = true)

    val isTrailer: Boolean
        get() = type.equals("trailer", ignoreCase = true)
}
