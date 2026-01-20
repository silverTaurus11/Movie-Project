package com.gayuh.movies.core.remote.source

import com.gayuh.movies.core.remote.dto.CastResponse
import com.gayuh.movies.core.remote.dto.MovieModel
import com.gayuh.movies.core.remote.dto.MovieResponse
import com.gayuh.movies.core.remote.dto.MovieVideoResponse

interface MovieDataSource {
    suspend fun getTopRated(page: Int): MovieResponse
    suspend fun getMovieDetail(id: Int): MovieModel
    suspend fun getMovieVideos(movieId: Int): MovieVideoResponse
    suspend fun getMovieCredits(movieId: Int): CastResponse
}