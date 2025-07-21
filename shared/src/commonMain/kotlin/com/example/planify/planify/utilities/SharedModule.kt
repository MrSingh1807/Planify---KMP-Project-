package com.example.planify.planify.utilities

import com.example.planify.planify.domainLayer.RoomUseCase
import com.example.planify.planify.roomDB.ToDoDataBase
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class SharedModule : KoinComponent {
    val sharedPref: SharedPreference by inject()
//    val todoDB: ToDoDataBase by inject()

    val roomUseCase : RoomUseCase by inject()

}
