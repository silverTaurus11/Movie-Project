package com.gayuh.movies.core.workmanager

import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.gayuh.movies.core.database.AppDatabase
import com.gayuh.movies.core.remote.MoviesApi
import com.gayuh.movies.core.remote.source.MovieRemoteDataSourceImpl
import com.gayuh.movies.data.repository.MovieSyncRepositoryImpl
import io.flutter.Log

class MovieSyncWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        return try {
            val db = AppDatabase.open(applicationContext)


            val repository = MovieSyncRepositoryImpl(
                MovieRemoteDataSourceImpl(MoviesApi.createApi()),
                db.movieDao()
            )

            repository.syncTopRated()
            Result.success()
        } catch (e: Exception) {
            Log.e("Error::", e.message ?: "")
            Result.retry()
        }
    }
}
