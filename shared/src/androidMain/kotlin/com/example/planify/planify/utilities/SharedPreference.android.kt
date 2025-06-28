package com.example.planify.planify.utilities

import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.floatPreferencesKey
import androidx.datastore.preferences.core.intPreferencesKey
import androidx.datastore.preferences.core.longPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import com.example.planify.planify.dataLayer.DataStorePref
import kotlinx.coroutines.runBlocking

actual class SharedPreference(private val dataStore: DataStorePref) {

    actual fun save(key: String, value: String) {
        runBlocking { dataStore.setValue(stringPreferencesKey(key), value) }
    }

    actual fun save(key: String, value: Int) {
        runBlocking { dataStore.setValue(intPreferencesKey(key), value) }
    }

    actual fun save(key: String, value: Float) {
        runBlocking { dataStore.setValue(floatPreferencesKey(key), value) }
    }

    actual fun save(key: String, value: Long) {
        runBlocking { dataStore.setValue(longPreferencesKey(key), value) }
    }

    actual fun save(key: String, value: Boolean) {
        runBlocking { dataStore.setValue(booleanPreferencesKey(key), value) }
    }

    actual fun getString(key: String, defaultValue: String?): String {
        return dataStore.value(stringPreferencesKey(key)) ?: defaultValue ?: ""
    }

    actual fun getInt(key: String, defaultValue: Int?): Int {
        return dataStore.value(intPreferencesKey(key)) ?: defaultValue ?: -1
    }

    actual fun getFloat(key: String, defaultValue: Float?): Float {
        return dataStore.value(floatPreferencesKey(key)) ?: defaultValue ?: 0f
    }

    actual fun getLong(key: String, defaultValue: Long?): Long {
        return dataStore.value(longPreferencesKey(key)) ?: defaultValue ?: -1L
    }

    actual fun getBoolean(key: String, defaultValue: Boolean?): Boolean {
        return dataStore.value(booleanPreferencesKey(key)) ?: defaultValue ?: false
    }

    actual fun removeKey(key: String) {
//        dataStore.remove(key)
    }

    actual fun clear() {
        dataStore.clear()
    }
}