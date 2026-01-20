package com.gayuh.movies.core.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.gayuh.movies.core.database.dao.MovieDao
import com.gayuh.movies.core.database.entity.MovieEntity

@Database(
    entities = [MovieEntity::class],
    version = DbConfig.DB_VERSION,
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {

    abstract fun movieDao(): MovieDao

    companion object {
        fun open(context: Context): AppDatabase =
            Room.databaseBuilder(
                context,
                AppDatabase::class.java,
                DbConfig.DB_NAME
            ).build()
    }
}
