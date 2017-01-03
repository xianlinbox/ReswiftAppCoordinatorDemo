//
//  AppCoordinator.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 03/01/2017.
//

import Foundation
import UIKit

class AppCoordinator {
    var rootController: UINavigationController

    init(){
        let searchVC = SearchViewController()
        searchVC.coordinator = self
        rootController = UINavigationController(rootViewController: searchVC)
    }
}

extension AppCoordinator {
    func showSearchResults() {

    }
}
