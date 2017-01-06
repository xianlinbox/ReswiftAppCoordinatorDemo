//
//  BaseViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 06/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import UIKit
import ReSwift

class BaseViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    let activityInd =  UIActivityIndicatorView(activityIndicatorStyle:.gray)

    //MARK: update state
    func newState(state: AppState) {
        if state.isLoading {
            self.view.addSubview(self.activityInd)
            self.activityInd.startAnimating()
        } else {
            self.activityInd.stopAnimating()
        }
    }

    //MARK: lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self) { state in state }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configActivityIndicator()
    }

    func configActivityIndicator() {
        self.activityInd.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        self.activityInd.hidesWhenStopped = true
        self.activityInd.center = self.view.center
    }
}
