//
//  SearchResultViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 08/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import UIKit

class SearchResultSceneViewController: BaseViewController {

    let propertyActionCreater = PropertyActionCreater()
    var searchResultView:SearchResultView?

    //MARK: update state
    override func newState(state: AppState) {
        super.newState(state: state)
    }

    //MARK: user action
    func showPropertyDetail(searchCriteria:SearchCriteria) {

    }

    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(searchResultView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
