package com.gayuh.movies.core.remote.source

import com.gayuh.movies.core.remote.MoviesApi
import com.gayuh.movies.core.remote.dto.CastResponse
import com.gayuh.movies.core.remote.dto.MovieModel
import com.gayuh.movies.core.remote.dto.MovieResponse
import com.gayuh.movies.core.remote.dto.MovieVideoResponse

class MovieRemoteDataSourceImpl(
    private val api: MoviesApi,
) : MovieDataSource {

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

    override suspend fun getMovieVideos(movieId: Int): MovieVideoResponse =
        api.getMovieVideos(movieId, language = "en-US")

    override suspend fun getMovieCredits(movieId: Int): CastResponse =
        api.getMovieCredits(movieId, language = "en-US")

}
