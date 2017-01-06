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
    var indicatorView:UIView?
    
    func newState(state: AppState) {

    }
}
