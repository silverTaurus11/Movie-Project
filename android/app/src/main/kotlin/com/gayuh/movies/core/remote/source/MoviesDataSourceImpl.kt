package com.gayuh.movies.core.remote.source

import com.gayuh.movies.core.remote.MoviesApi
import com.gayuh.movies.core.remote.dto.MovieModel
import com.gayuh.movies.core.remote.dto.MovieResponse

class MovieRemoteDataSourceImpl(
    private val api: MoviesApi,
): MovieDataSource {

    override suspend fun getTopRated(page: Int): MovieResponse =
        api.getTopRated(
            language = "en-US",
            page = page
        )

    override suspend fun getMovieDetail(id: Int): MovieModel =
        api.getMovieDetail(
            id,
            language = "en-US"
        )
}
