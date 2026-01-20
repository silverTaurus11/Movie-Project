package com.gayuh.movies.core.remote

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

object NetworkModule {
    private val moshi = Moshi.Builder()
        .add(KotlinJsonAdapterFactory())
        .build()

    val retrofit = Retrofit.Builder()
        .baseUrl("https://api.themoviedb.org/3/")
        .addConverterFactory(MoshiConverterFactory.create(moshi))
        .client(provideOkHttp("eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYmZhNTE1MmFkZDEwZTdhYzY4YmI2OTI0NDE2Y2YzYyIsIm5iZiI6MTc2NjAyODU3OS4wMTMsInN1YiI6IjY5NDM3NTIzMjY5NTdhZjgwMzM4YmJjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zGI4zPH35g1D8bdh9cfd9gGNqhD0yFJRALz2rrsIZtc"))
        .build()

    fun provideOkHttp(token: String): OkHttpClient =
        OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request()
                    .newBuilder()
                    .addHeader("Authorization", "Bearer $token")
                    .addHeader("accept", "application/json")
                    .build()
                chain.proceed(request)
            }
            .addInterceptor(
                HttpLoggingInterceptor().apply {
                    level = HttpLoggingInterceptor.Level.BASIC
                }
            )
            .build()

}