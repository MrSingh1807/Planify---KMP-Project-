package com.example.planify.planify.utilities

//import data.database.instantiateImpl
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.RoomDatabaseConstructor
import androidx.sqlite.driver.bundled.BundledSQLiteDriver
import com.example.planify.planify.roomDB.ToDoDataBase
import kotlinx.cinterop.ExperimentalForeignApi
import platform.Foundation.NSDocumentDirectory
import platform.Foundation.NSFileManager
import platform.Foundation.NSUserDomainMask

@Suppress(names = ["NO_ACTUAL_FOR_EXPECT"])
actual object ToDoDataBaseConstructor :
    RoomDatabaseConstructor<ToDoDataBase> {

    actual override fun initialize(): ToDoDataBase {
        return getDatabaseBuilder().build()
    }
}


fun getDatabaseBuilder(): RoomDatabase.Builder<ToDoDataBase> {
    val dbFilePath = documentDirectory() + "/todo.db"
    return Room.databaseBuilder<ToDoDataBase>(
        name = dbFilePath,
//        factory = { ToDoDataBase::class.instantiateImpl()  }
    ).setDriver(BundledSQLiteDriver()) // Very important
}

@OptIn(ExperimentalForeignApi::class)
private fun documentDirectory(): String {
    val documentDirectory = NSFileManager.defaultManager.URLForDirectory(
        directory = NSDocumentDirectory,
        inDomain = NSUserDomainMask,
        appropriateForURL = null,
        create = false,
        error = null,
    )
    return requireNotNull(documentDirectory?.path)
}