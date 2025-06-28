package com.example.planify.planify.utilities

import platform.Foundation.NSUserDefaults

actual class SharedPreference {

    private val userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults

    actual fun save(key: String, value: String) {
        userDefaults.setObject(value, forKey = key)
    }

    actual fun save(key: String, value: Int) {
        userDefaults.setInteger(value.toLong(), forKey = key)
    }

    actual fun save(key: String, value: Float) {
        userDefaults.setFloat(value, forKey = key)
    }

    actual fun save(key: String, value: Long) {
        userDefaults.setObject(value, forKey = key)
    }

    actual fun save(key: String, value: Boolean) {
        userDefaults.setBool(value, forKey = key)
    }

    actual fun getString(key: String, defaultValue: String?): String {
        val value = userDefaults.stringForKey(key)
        return value ?: defaultValue ?: ""
    }

    actual fun getInt(key: String, defaultValue: Int?): Int {
        val value = userDefaults.integerForKey(key)
        return if (value == 0L && userDefaults.objectForKey(key) == null) {
            defaultValue ?: 0
        } else {
            value.toInt()
        }
    }

    actual fun getFloat(key: String, defaultValue: Float?): Float {
        val value = userDefaults.floatForKey(key)
        return if (value == 0f && userDefaults.objectForKey(key) == null) {
            defaultValue ?: 0f
        } else {
            value
        }
    }

    actual fun getLong(key: String, defaultValue: Long?): Long {
        val value = userDefaults.objectForKey(key) as? Long
        return value ?: defaultValue ?: 0L
    }

    actual fun getBoolean(key: String, defaultValue: Boolean?): Boolean {
        val value = userDefaults.boolForKey(key)
        return if (!value && userDefaults.objectForKey(key) == null) {
            defaultValue ?: false
        } else {
            value
        }
    }

    actual fun removeKey(key: String) {
        userDefaults.removeObjectForKey(key)
    }


    actual fun clear() {
        val dictionary = userDefaults.dictionaryRepresentation()
        dictionary.keys.forEach {
            userDefaults.removeObjectForKey(it.toString())
        }
    }
}