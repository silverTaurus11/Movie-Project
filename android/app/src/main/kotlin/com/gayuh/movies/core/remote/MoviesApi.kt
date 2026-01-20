package com.gayuh.movies.core.remote

import com.gayuh.movies.core.remote.dto.MovieModel
import com.gayuh.movies.core.remote.dto.MovieResponse
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface MoviesApi {
    @GET("movie/top_rated")
    suspend fun getTopRated(
        @Query("language") language: String,
        @Query("page") page: Int
    ): MovieResponse

    @GET("movie/{id}")
    suspend fun getMovieDetail(
        @Path("id") id: Int,
        @Query("language") language: String
    ): MovieModel

    companion object {

        fun createApi(): MoviesApi {
            return NetworkModule.retrofit.create(MoviesApi::class.java)
        }
    }
}