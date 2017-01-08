//
//  SearchResultView.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 08/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import UIKit

class SearchResultView:XibBaseView{

    @IBOutlet var resultTableView:UITableView?
    var properties:[PropertyDetail]?

    func update(properties:[PropertyDetail]) {
        self.properties = properties
    }
}

extension SearchResultView:  UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.properties?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "property", for: indexPath)

        if let property = self.properties?[indexPath.row] {
            cell.textLabel?.text = property.title
            cell.detailTextLabel?.text = String(property.price)
            if let url  = URL(string: property.imgUrl), let data = NSData(contentsOf: url)
            {
                cell.imageView?.image =  UIImage(data: data as Data)
            }
        }

        return cell
    }
    
}
