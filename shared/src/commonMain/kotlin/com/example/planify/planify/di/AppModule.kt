package com.example.todo_app.di

import com.example.planify.planify.domainLayer.RoomUseCase
import org.koin.dsl.module


val commonAppModule = module {

    single {
        RoomUseCase(get())
    }

}
