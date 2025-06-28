package com.example.planify.planify.di

import android.content.Context
import com.example.planify.planify.dataLayer.DataStorePref
import com.example.planify.planify.dataLayer.DataStorePreferenceImpl
import com.example.planify.planify.utilities.SharedPreference
import org.koin.android.ext.koin.androidApplication
import org.koin.dsl.module

fun platformModuleAndroid(context: Context) = module {

    single {
        androidApplication()
    }

    single<Context> { context }

    single<DataStorePref> {
        DataStorePreferenceImpl(get())
    }

//    single<RoomDatabase> { RoomDBImpl(get()) }

    single {
        SharedPreference(get())
    }

}
