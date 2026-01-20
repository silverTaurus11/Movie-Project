package com.gayuh.movies.core.database.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "movie_videos",
    indices = [Index(value = ["movie_id"])]
)
data class MovieVideoEntity(
    @PrimaryKey
    @ColumnInfo(name = "id")
    val id: String,

    @ColumnInfo(name = "movie_id")
    val movieId: Int,

    @ColumnInfo(name = "name")
    val name: String,

    @ColumnInfo(name = "key")
    val key: String,

    @ColumnInfo(name = "site")
    val site: String,

    @ColumnInfo(name = "type")
    val type: String,

    @ColumnInfo(name = "official")
    val official: Int
)
