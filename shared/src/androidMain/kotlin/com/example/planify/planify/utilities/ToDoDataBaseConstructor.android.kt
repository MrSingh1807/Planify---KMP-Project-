package com.example.planify.planify.utilities

import android.content.Context
import androidx.room.Room
import androidx.room.RoomDatabaseConstructor
import com.example.planify.planify.roomDB.ToDoDataBase

actual object ToDoDataBaseConstructor : RoomDatabaseConstructor<ToDoDataBase> {

    private var db: ToDoDataBase? = null

    actual override fun initialize() = db!!

    fun createDB(ctx: Context) {
        val dbFile = ctx.applicationContext.getDatabasePath("todo.db")
        db = Room.databaseBuilder<ToDoDataBase>(
            context = ctx.applicationContext,
            name = dbFile.absolutePath
        ).build()
    }

}

