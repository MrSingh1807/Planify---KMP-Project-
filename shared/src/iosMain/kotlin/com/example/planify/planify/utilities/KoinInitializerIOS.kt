package com.example.planify.planify.utilities

import com.example.todo_app.di.commonAppModule
import com.example.planify.planify.di.platformModuleIOS
import com.example.todo_app.utilities.KoinInitializer
import org.koin.core.context.startKoin

class KoinInitializerIOS() : KoinInitializer {

    override fun initialize() {
        startKoin {
            modules(
                platformModuleIOS, commonAppModule
            )
        }
    }
}