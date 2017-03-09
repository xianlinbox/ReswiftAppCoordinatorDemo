//
//  SearchSceneCoordinator.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu  on 09/03/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import Foundation

protocol SearchSceneCoordinatorProtocol {
    func searchByCity(searchCriteria:SearchCriteria)
    func searchByCurrentLocation()
}

class SearchSceneCoordinator: AppCoordinator, SearchSceneCoordinatorProtocol {
    let propertyActionCreater = PropertyActionCreater()
    
    func searchByCity(searchCriteria:SearchCriteria) {
        mainStore.dispatch(
            propertyActionCreater.searchProperties(searchCriteria: searchCriteria){
                let searchResultVC = SearchResultSceneViewController();
                //                searchResultVC.appCoordinator = self
                self.rootVC.pushViewController(searchResultVC, animated: true)
            }
        )
    }
    
    func searchByCurrentLocation() {
        mainStore.dispatch(propertyActionCreater.searchPropertiesByCurrentLocation())
    }
}
