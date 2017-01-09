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
        if let url  = URL(string: property.imgUrl), let data = NSData(contentsOf: url)
        {
            self.imageView?.image =  UIImage(data: data as Data)
        }
        self.nameLabel?.text = property.title
        self.priceLabel?.text = StringUtil.formatForPound(property.price)
        self.highlightLabel?.text = self.combine(property: property)
        self.highlightLabel?.sizeToFit()
        self.descriptionLabel?.text = property.description
        self.descriptionLabel?.sizeToFit()
    }

    private func combine(property:PropertyDetail) -> String {
        var result = "\(property.bedroomNumber) bed \(property.propertyType)"

        if(property.bathroomNumber != -1) {
            result += "," + String(property.bathroomNumber) + " "
            result += property.bathroomNumber > 1 ? "bathrooms" : "bathroom"
        }
        return result
    }
}
