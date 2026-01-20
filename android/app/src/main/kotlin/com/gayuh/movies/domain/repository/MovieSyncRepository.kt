package com.gayuh.movies.domain.repository

interface MovieSyncRepository {
    suspend fun syncTopRated()
}