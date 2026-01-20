package com.gayuh.movies.core.database.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "movie_cast",
    indices = [Index(value = ["movie_id"])]
)
data class MovieCastEntity(
    @PrimaryKey
    @ColumnInfo(name = "id")
    val id: Int,

    @ColumnInfo(name = "movie_id")
    val movieId: Int,

    @ColumnInfo(name = "name")
    val name: String,

    @ColumnInfo(name = "character")
    val character: String,

    @ColumnInfo(name = "profile_path")
    val profilePath: String
)
