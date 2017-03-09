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

    init(_ rootVC: UINavigationController){
        self.rootVC = rootVC
    }

    func start() {
        let searchVC = SearchSceneViewController();
        let searchSceneCoordinator = SearchSceneCoordinator(self.rootVC)
        searchVC.searchSceneCoordinator = searchSceneCoordinator
        self.rootVC.pushViewController(searchVC, animated: true)
    }

    func showAlert(errorMessage:String) {
        let alert = UIAlertController(title: "Oops!", message:errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.rootVC.topViewController?.present(alert, animated: true)
    }
}
