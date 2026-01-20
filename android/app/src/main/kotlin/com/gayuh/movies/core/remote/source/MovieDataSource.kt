package com.gayuh.movies.core.remote.source

import com.gayuh.movies.core.remote.dto.MovieModel
import com.gayuh.movies.core.remote.dto.MovieResponse

interface MovieDataSource {
    suspend fun getTopRated(page: Int): MovieResponse
    suspend fun getMovieDetail(id: Int): MovieModel
}