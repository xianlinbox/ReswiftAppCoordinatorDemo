//
//  ViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 03/01/2017.
//

import UIKit
import ReSwift

class SearchSceneViewController: BaseViewController {

    var searchSceneCoordinator:SearchSceneCoordinatorProtocol?
    var searchView:SearchView?

    //MARK: update state
    override func newState(state: AppState) {
        self.update(state: state)
        super.newState(state: state)
    }
    
    private func update(state: AppState) {
        if let searchCriteria = state.property.searchCriteria {
            searchView?.update(searchCriteria: searchCriteria)
        }
        if let errorMessage = state.errorMessage, !errorMessage.isEmpty {
            self.showAlert(errorMessage: errorMessage)
        }
    }
    
    //MARK: user action
    func searchByCity(searchCriteria:SearchCriteria) {
        searchSceneCoordinator?.searchByCity(searchCriteria: searchCriteria)
    }

    func searchByCurrentLocation() {
        searchSceneCoordinator?.searchByCurrentLocation()
    }

    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView = SearchView(frame: self.view.bounds)
        searchView?.goButtonOnClick = self.searchByCity
        searchView?.locationButtonOnClick = self.searchByCurrentLocation
        self.view.addSubview(searchView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
