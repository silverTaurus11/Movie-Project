package com.gayuh.movies.core.remote.dto

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class MovieResponse(
    @Json(name = "page")
    val page: Int = 1,

    @Json(name = "results")
    val results: List<MovieModel> = emptyList(),

    @Json(name = "total_pages")
    val totalPages: Int = 0,

    @Json(name = "total_results")
    val totalResults: Int = 0
)
