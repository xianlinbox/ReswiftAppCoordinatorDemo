//
//  AppCoordinator.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 03/01/2017.
//

import Foundation
import UIKit

class AppCoordinator {
    var rootVC: UINavigationController

    init(rootVC: UINavigationController){
        self.rootVC = rootVC
    }

    func start() {
        let searchVC = SearchViewController();
        self.rootVC.pushViewController(searchVC, animated: true)
    }
}

extension AppCoordinator {
    func showSearchResults() {

    }
}
