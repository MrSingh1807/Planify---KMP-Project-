package com.example.planify.planify.dataLayer

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.preferencesDataStore
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.runBlocking

interface DataStorePref {
    val db: Flow<Preferences>

    fun <T> getValue(key: Preferences.Key<T>): Flow<T?>
    fun <T> value(key: Preferences.Key<T>): T?

    suspend fun <T> setValue(key: Preferences.Key<T>, value: T)

    suspend fun <T> remove(key: Preferences.Key<T>)
    fun clear()
}

class DataStorePreferenceImpl(private val mContext: Context) : DataStorePref {
    private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "")

    override val db: Flow<Preferences>
        get() = mContext.dataStore.data

    override fun <T> getValue(key: Preferences.Key<T>): Flow<T?> {
        return db.map { it[key] }
    }

    override fun <T> value(key: Preferences.Key<T>): T? {
        return runBlocking { db.map { it[key] }.firstOrNull() }
    }

    override suspend fun <T> setValue(key: Preferences.Key<T>, value: T) {
        mContext.dataStore.edit { it[key] = value }
    }

    override suspend fun <T> remove(key: Preferences.Key<T>) {
        mContext.dataStore.edit { it.remove(key) }
    }

    override fun clear() {
        runBlocking(Dispatchers.IO) {
//            val fcmToken = value(PreferenceKey.FCM_TOKEN)
            mContext.dataStore.edit { it.clear() }
//            setValue(PreferenceKey.FCM_TOKEN, fcmToken ?: "")
        }

    }

}