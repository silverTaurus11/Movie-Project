package com.gayuh.movies.core.remote.dto

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class CastResponse(
    @Json(name = "cast")
    val cast: List<CastModel> = emptyList()
)
