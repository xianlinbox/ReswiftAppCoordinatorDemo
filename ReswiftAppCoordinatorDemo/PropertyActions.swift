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
    let response:Any
}

struct UpdateSelectedProperty: Action {
    let selectedPropertyIndex:Int
}

struct PropertyActionCreater {
    typealias ActionCreator = (_ state: AppState, _ store: Store<AppState>) -> Action?
    typealias AsyncActionCreator = (_ state: AppState, _ store: Store<AppState>,  _ callback:  @escaping (_ actionCreator: ActionCreator) -> Void ) -> Void
    let propertyApi = PropertyApi()
    let locationTracker = LocationTracker()

    func searchProperties(searchCriteria: SearchCriteria, _ callback:(() -> Void)?) -> ActionCreator {
        return { state, store in
            store.dispatch(UpdateSearchCriteria(searchCriteria: searchCriteria))

            self.propertyApi.findProperties(
                searchCriteria: searchCriteria,
                success: { (response) in
                    store.dispatch(UpdateProperties(response: response))
                    store.dispatch(EndLoading())
                    callback?()
            },
                failure: { (error) in
                    store.dispatch(EndLoading())
                    store.dispatch(SaveErrorMessage(errorMessage: (error?.localizedDescription)!))
            }
            )
            return StartLoading()
        }
    }


    func searchPropertiesByCurrentLocation(_ nextStep:(() -> Void)?) -> AsyncActionCreator {

        return { maybeState, store, callback in
            store.dispatch(StartLoading())
            self.locationTracker.getCurrentLocation(
                success: { currentLocation in
                    let searchCriteria = SearchCriteria(
                        placeName:nil,
                        centerPoint: currentLocation
                    )
                    callback(self.searchProperties(searchCriteria: searchCriteria, nextStep))
                    },
                fail: { errorMessage in
                        store.dispatch(SaveErrorMessage(errorMessage: errorMessage))
                        store.dispatch(EndLoading())
                    }
            )
        }
    }
    
}






