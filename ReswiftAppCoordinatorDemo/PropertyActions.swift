//
//  PropertyActions.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import ReSwift

struct UpdateSearchCriteria: Action {
    let searchCriteria:SearchCriteria
}

struct UpdateProperties: Action {
    let properties:String
}

struct PropertyActionCreater {
    typealias ActionCreator = (_ state: AppState, _ store: Store<AppState>) -> Action?
    let propertyApi = PropertyApi()

    func searchProperties(searchCriteria: SearchCriteria) -> ActionCreator {
        return { state, store in
            self.propertyApi.findProperties(
                searchCriteria: searchCriteria,
                success: { (data) in
                    store.dispatch(EndLoading())
                    },
                failure: { (error) in
                    store.dispatch(EndLoading())
                    }
            )
            return StartLoading()
        }
    }
}




