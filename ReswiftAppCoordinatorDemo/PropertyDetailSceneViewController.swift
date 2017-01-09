//
//  PropertyDetailSceneViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 09/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

class PropertyDetailSceneViewController: BaseViewController {
    var propertyDetailView:PropertyDetailView?


    //MARK: update state
    override func newState(state: AppState) {
        if let property = state.property.properties?[state.property.selectedProperty] {
            self.propertyDetailView?.update(property: property)
        }

        super.newState(state: state)
    }

    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        propertyDetailView = PropertyDetailView(frame: self.view.bounds)
        self.view.addSubview(propertyDetailView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
