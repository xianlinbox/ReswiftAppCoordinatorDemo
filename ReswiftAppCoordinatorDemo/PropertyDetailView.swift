//
//  PropertyDetailView.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 09/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import UIKit

class PropertyDetailView:XibBaseView{
    
    @IBOutlet var imageView:UIImageView?
    @IBOutlet var nameLabel:UILabel?
    @IBOutlet var priceLabel:UILabel?
    @IBOutlet var highlightLabel:UILabel?
    @IBOutlet var descriptionLabel:UILabel?

    func update(property:PropertyDetail) {
    }
}
