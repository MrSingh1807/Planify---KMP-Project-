package com.example.planify.planify.di

import com.example.planify.planify.utilities.SharedPreference
import org.koin.dsl.module

val platformModuleIOS = module {

    single {
        SharedPreference()
    }

}
