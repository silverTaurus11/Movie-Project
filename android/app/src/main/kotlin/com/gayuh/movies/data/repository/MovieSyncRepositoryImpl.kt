package com.gayuh.movies.data.repository

import androidx.room.withTransaction
import com.gayuh.movies.core.database.AppDatabase
import com.gayuh.movies.core.database.dao.MovieDao
import com.gayuh.movies.core.remote.dto.CastModel.Companion.toEntity
import com.gayuh.movies.core.remote.dto.MovieModel.Companion.toEntity
import com.gayuh.movies.core.remote.dto.MovieVideoModel.Companion.toEntity
import com.gayuh.movies.core.remote.source.MovieDataSource
import com.gayuh.movies.domain.repository.MovieSyncRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit

class MovieSyncRepositoryImpl(
    private val remote: MovieDataSource,
    private val database: AppDatabase,
    private val dao: MovieDao
) : MovieSyncRepository {

    override suspend fun syncTopRated(): Unit = coroutineScope {
        val response = remote.getTopRated(page = 1)

        response.results
            .map { summary ->
                async(Dispatchers.IO) {
                    syncSingleMovie(summary.id)
                }
            }
            .awaitAll()
    }

    private val semaphore = Semaphore(4)

    private suspend fun syncSingleMovie(movieId: Int) = coroutineScope {
        semaphore.withPermit {
            val detailDeferred = async(Dispatchers.IO) { remote.getMovieDetail(movieId) }
            val castDeferred = async(Dispatchers.IO) { remote.getMovieCredits(movieId) }
            val videosDeferred = async(Dispatchers.IO) { remote.getMovieVideos(movieId) }

            val detail = detailDeferred.await()
            val cast = castDeferred.await()
            val videos = videosDeferred.await()

            database.withTransaction {
                dao.upsertMovie(detail.toEntity())
                dao.upsertCast(cast.cast.map { it.toEntity(movieId) })
                dao.upsertVideos(videos.results.filter { it.isYoutube && it.isTrailer }
                    .map { it.toEntity(movieId) })
            }
        }
    }
}