package com.gayuh.movies.core.database.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Transaction
import com.gayuh.movies.core.database.entity.MovieCastEntity
import com.gayuh.movies.core.database.entity.MovieEntity
import com.gayuh.movies.core.database.entity.MovieVideoEntity

@Dao
interface MovieDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertMovie(entity: MovieEntity)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertCast(entities: List<MovieCastEntity>)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertVideos(entities: List<MovieVideoEntity>)
}
