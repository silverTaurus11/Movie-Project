package com.gayuh.movies.core

import android.app.Application
import androidx.work.Constraints
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import com.gayuh.movies.core.workmanager.MovieSyncWorker

class MovieApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        // This is where your sync trigger belongs
        enqueueMovieSync()
    }

    private fun enqueueMovieSync() {
        WorkManager.getInstance(this)
            .enqueueUniqueWork(
                "movie_sync",
                ExistingWorkPolicy.KEEP,
                OneTimeWorkRequestBuilder<MovieSyncWorker>()
                    .setConstraints(
                        Constraints.Builder()
                            .setRequiredNetworkType(NetworkType.CONNECTED)
                            .build()
                    )
                    .build()
            )
    }
}