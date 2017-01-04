//
//  AppState.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import ReSwift

struct AppState: StateType {
    var isLoading:Bool = false
    var errorMessage:String?
    var property:PropertyState = PropertyState()
}

struct PropertyState {
    var placeName:String = "London"
    var properties:[PropertyDetail] = []
}

struct PropertyDetail {
    var title:String
    var price:Double
    var imgUrl:String
}

