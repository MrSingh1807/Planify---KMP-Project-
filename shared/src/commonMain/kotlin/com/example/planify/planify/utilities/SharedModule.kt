package com.example.planify.planify.utilities

import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class SharedModule() : KoinComponent {
    val sharedPref: SharedPreference by inject()


}
