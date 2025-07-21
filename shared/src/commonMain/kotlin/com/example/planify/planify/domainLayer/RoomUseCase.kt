package com.example.planify.planify.domainLayer

import com.example.planify.planify.roomDB.ToDoDataBase
import com.example.planify.planify.roomDB.TodoDao
import com.example.planify.planify.roomDB.TodoEntity
import com.example.planify.planify.utilities.universalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

class RoomUseCase(db : ToDoDataBase) {

    private val todoDao: TodoDao = db.getDao()


    init {
        val item = TodoEntity(title = "Mr", content = "Cool")
        val item2 = TodoEntity(title = "Mr", content = "Singh")

        universalScope.launch {
            todoDao.insert(item)
            todoDao.insert(item2)
        }
    }

    fun getCount(): Int = runBlocking { todoDao.count() }

}