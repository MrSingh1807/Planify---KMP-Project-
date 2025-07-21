package com.example.planify.planify.roomDB

import androidx.room.Entity
import androidx.room.PrimaryKey


@Entity
data class Categories(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val title: String,
)
