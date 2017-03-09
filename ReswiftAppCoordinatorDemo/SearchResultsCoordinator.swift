//
//  SearchResultsCoordinator.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu  on 09/03/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import Foundation

protocol SearchResultsSceneCoordinatorProtocol {
    func showPropertyDetail(index:Int)
}

class SearchResultsSceneCoordinator:AppCoordinator,SearchResultsSceneCoordinatorProtocol {
    let propertyActionCreater = PropertyActionCreater()
    
    func showPropertyDetail(index:Int) {
        mainStore.dispatch(UpdateSelectedProperty(selectedPropertyIndex: index))
        let propertyDetailVC = PropertyDetailSceneViewController();
        self.rootVC.pushViewController(propertyDetailVC, animated: true)
    }
}
