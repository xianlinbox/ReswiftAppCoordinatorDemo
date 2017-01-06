//
//  SearchView.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 06/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

import  UIKit

class SearchView:XibBaseView {

    @IBOutlet var placeNameField:UITextField!

    var goButtonOnClick:((_ searchCriteria:SearchCriteria) -> Void)?
    var locationButtonOnClick: (() -> Void)?

    @IBAction func goButtonTapped() {
        if self.placeNameField.text == "" {
            self.placeNameField.text = self.placeNameField.placeholder
        }
        
        let searchCriteria = SearchCriteria(
            placeName: self.placeNameField.text,
            centerPoint:nil
        )
        
        if let goButtonCallback = self.goButtonOnClick{
            goButtonCallback(searchCriteria)
        }
    }

    @IBAction func locationButtonTapped() {

        if let locationButtonCallback = self.locationButtonOnClick {
            locationButtonCallback()
        }
    }

    func update(searchCriteria:SearchCriteria) {
        self.placeNameField.text = searchCriteria.placeName
    }
}
