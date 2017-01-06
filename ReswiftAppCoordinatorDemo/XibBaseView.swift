//
//  SearchView.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import UIKit

class XibBaseView:UIView {

    var nibView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initialize()
    }

    func initialize() {
        if let nibName = self.nibName {
            nibView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?[0] as? UIView

            if let actualNibView = nibView {
                actualNibView.frame = self.bounds
                super.addSubview(actualNibView)
                actualNibView.translatesAutoresizingMaskIntoConstraints = false
                self.addConstraint(format: "H:|[view]|", views: ["view": actualNibView])
                self.addConstraint(format: "V:|[view]|", views: ["view": actualNibView])
            }
        }
    }
    func addConstraint(format: String, views: [String : UIView]) {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: views)
        self.addConstraints(constraints)
    }

    override func addSubview(_ view: UIView) {
        if let actualNibView = nibView {
            actualNibView.addSubview(view)
        } else {
            super.addSubview(view)
        }
    }

    var nibName: String? {
        let typeLongName = type(of: self).description()
        let tokens = typeLongName.characters.split {$0 == "."}.map(String.init)
        return tokens.last!
    }
}
