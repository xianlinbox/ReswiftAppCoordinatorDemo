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
        mainStore.dispatch(SaveErrorMessage(errorMessage: ""))
        mainStore.dispatch(
            propertyActionCreater.searchProperties(searchCriteria: searchCriteria){
                self.pushSearchResultViewController()
            }
        )
    }
    
    func searchByCurrentLocation() {
        mainStore.dispatch(SaveErrorMessage(errorMessage: ""))
        mainStore.dispatch(propertyActionCreater.searchPropertiesByCurrentLocation(){
            self.pushSearchResultViewController()
        })
    }
    
    private func pushSearchResultViewController() {
        let searchResultVC = SearchResultSceneViewController();
        let searchResultCoordinator = SearchResultsSceneCoordinator(self.rootVC)
        searchResultVC.searchResultCoordinator = searchResultCoordinator
        self.rootVC.pushViewController(searchResultVC, animated: true)
    }
}
