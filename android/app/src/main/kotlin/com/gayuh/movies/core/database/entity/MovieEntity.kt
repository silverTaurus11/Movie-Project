package com.gayuh.movies.core.database.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "movies")
data class MovieEntity(
    @PrimaryKey val id: Int,
    val title: String,
    val overview: String,
    @ColumnInfo(name = "poster_path") val posterPath: String,
    @ColumnInfo(name = "backdrop_path") val backdropPath: String,
    @ColumnInfo(name = "release_date") val releaseDate: String,
    val runtime: Int,
    @ColumnInfo(name = "vote_average") val voteAverage: Double,
    val tagline: String,
    val genres: String, // JSON
    val adult: Int,
    @ColumnInfo(name = "original_language") val originalLanguage: String,
    @ColumnInfo(name = "updated_at") val updatedAt: Long
)
