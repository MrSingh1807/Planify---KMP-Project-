package com.example.planify.planify

import android.app.Application
import com.example.todo_app.utilities.KoinInitializerAndroid

class PlanifyApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        KoinInitializerAndroid(this).initialize()

    }

}