package com.example.planify.planify.utilities


expect class SharedPreference {
    fun save(key: String, value: String)
    fun save(key: String, value: Int)
    fun save(key: String, value: Float)
    fun save(key: String, value: Long)
    fun save(key: String, value: Boolean)

    fun getString(key: String, defaultValue: String? = null): String
    fun getInt(key: String, defaultValue: Int? = null): Int
    fun getFloat(key: String, defaultValue: Float? = null): Float
    fun getLong(key: String, defaultValue: Long? = null): Long
    fun getBoolean(key: String, defaultValue: Boolean? = null): Boolean

    fun removeKey(key: String)
    fun clear()
}