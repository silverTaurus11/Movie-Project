package com.gayuh.movies.core.remote.dto

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class MovieVideoResponse(
    @Json(name = "results")
    val results: List<MovieVideoModel> = emptyList()
)