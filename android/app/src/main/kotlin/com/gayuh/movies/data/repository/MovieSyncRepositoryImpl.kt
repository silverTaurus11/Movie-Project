package com.gayuh.movies.data.repository

import com.gayuh.movies.core.database.dao.MovieDao
import com.gayuh.movies.core.remote.dto.MovieModel.Companion.toEntity
import com.gayuh.movies.core.remote.source.MovieDataSource
import com.gayuh.movies.domain.repository.MovieSyncRepository

class MovieSyncRepositoryImpl(
    private val remote: MovieDataSource,
    private val dao: MovieDao
) : MovieSyncRepository {

    override suspend fun syncTopRated() {
        val response = remote.getTopRated(page = 1)

        response.results.forEach { summary ->
            val detail = remote.getMovieDetail(summary.id)
            dao.upsert(detail.toEntity())
        }
    }
}