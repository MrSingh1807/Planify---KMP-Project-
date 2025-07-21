package com.example.planify.planify.roomDB

import androidx.room.ConstructedBy
import androidx.room.Database
import androidx.room.RoomDatabase
import com.example.planify.planify.utilities.ToDoDataBaseConstructor


@Database(entities = [TodoEntity::class], version = 1)
@ConstructedBy(ToDoDataBaseConstructor::class)
abstract class ToDoDataBase : RoomDatabase() {
  abstract fun getDao(): TodoDao
}
