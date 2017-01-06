//
//  ViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 03/01/2017.
//

import UIKit
import ReSwift

class SearchSceneViewController: BaseViewController {

    let propertyActionCreater = PropertyActionCreater()
    var searchView:SearchView?

    //MARK: update state
    override func newState(state: AppState) {
        super.newState(state: state)
        if let searchCriteria = state.property.searchCriteria {
            searchView?.update(searchCriteria: searchCriteria)
        }
    }
    
    //MARK: user action
    func searchByCity(searchCriteria:SearchCriteria) {
        mainStore.dispatch(propertyActionCreater.searchProperties(searchCriteria: searchCriteria))
    }

    func searchByCurrentLocation() {
//        mainStore.dispatch(propertyActionCreater.searchPropertiesByCurrentLocation())
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
        searchView = SearchView(frame: self.view.bounds)
        searchView?.goButtonOnClick = self.searchByCity;
//        searchView?.locationButtonOnClick = self.searchByCurrentLocation()
        self.view.addSubview(searchView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
