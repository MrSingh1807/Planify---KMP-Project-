package com.example.planify.planify

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform