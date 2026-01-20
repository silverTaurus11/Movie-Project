package com.gayuh.movies.core.workmanager

import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.gayuh.movies.core.database.AppDatabase
import com.gayuh.movies.core.remote.MoviesApi
import com.gayuh.movies.core.remote.source.MovieRemoteDataSourceImpl
import com.gayuh.movies.data.repository.MovieSyncRepositoryImpl
import io.flutter.Log
import androidx.core.content.edit
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class MovieSyncWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        return try {
            val db = AppDatabase.open(applicationContext)

            val repository = MovieSyncRepositoryImpl(
                MovieRemoteDataSourceImpl(MoviesApi.createApi()),
                db,
                db.movieDao()
            )

            repository.syncTopRated()

            withContext(Dispatchers.Main) {
                checkFirstSyncStatus()
            }

            Result.success()
        } catch (e: Exception) {
            Log.e("Error::", e.message ?: "")
            Result.retry()
        }
    }

    private fun checkFirstSyncStatus() {
        val prefs = applicationContext.getSharedPreferences(
            "sync_prefs",
            Context.MODE_PRIVATE
        )

        val firstSyncDone = prefs.getBoolean("first_sync_done", false)

        if (!firstSyncDone) {
            prefs.edit { putBoolean("first_sync_done", true) }
            MovieSyncEventChannel.notifyFirstSyncDone()
        }
    }
}
