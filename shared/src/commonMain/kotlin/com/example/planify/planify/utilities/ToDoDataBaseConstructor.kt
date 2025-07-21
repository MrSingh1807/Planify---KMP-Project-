package com.example.planify.planify.utilities

import androidx.room.RoomDatabaseConstructor
import com.example.planify.planify.roomDB.ToDoDataBase


// The Room compiler generates the `actual` implementations.
expect object ToDoDataBaseConstructor : RoomDatabaseConstructor<ToDoDataBase> {
    override fun initialize(): ToDoDataBase
}