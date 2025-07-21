package com.example.planify.planify.utilities

import kotlinx.coroutines.CoroutineExceptionHandler
import kotlinx.coroutines.CoroutineName
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.IO
import kotlinx.coroutines.SupervisorJob


private val executors = Dispatchers.IO
private val exceptionHandler = CoroutineExceptionHandler { _, ex ->
    ex.printStackTrace()
}
val universalScope = CoroutineScope(SupervisorJob() + CoroutineName("Universal") + executors + exceptionHandler)
