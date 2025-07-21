package com.example.planify.planify.di

import com.example.planify.planify.roomDB.ToDoDataBase
import com.example.planify.planify.utilities.SharedPreference
import com.example.planify.planify.utilities.ToDoDataBaseConstructor
import org.koin.dsl.module

val platformModuleIOS = module {

    single {
        SharedPreference()
    }

    single<ToDoDataBase> {
        ToDoDataBaseConstructor.initialize()
    }

}
