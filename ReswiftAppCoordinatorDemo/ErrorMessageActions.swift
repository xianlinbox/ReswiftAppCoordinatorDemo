//
//  ErrorMessageReducer.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import ReSwift

struct SaveErrorMessage: Action {
    let errorMessage:String
}

struct CleanErrorMessage: Action {}
