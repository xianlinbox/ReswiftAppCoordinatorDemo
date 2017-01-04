//
//  PropertyActions.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import ReSwift

struct UpdateSearchPlaceName: Action {
    let placeName:String
}

struct UpdateProperties: Action {
    let properties:String
}

struct searchPropertyActionCreater {
    var propertyApi = PropertyApi.self

    func searchProperties(state: AppState, store: Store<AppState>) -> Action? {

//        Octokit(configuration).repositories { response in
//            dispatch_async(dispatch_get_main_queue()) {
//                store.dispatch(SetRepostories(repositories: response))
//            }
//        }
        
        return nil
    }
}




