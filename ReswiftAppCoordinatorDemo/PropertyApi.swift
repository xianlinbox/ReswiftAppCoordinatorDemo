//
//  PropertyApi.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import Alamofire

struct PropertyApi {
    func findProperties(searchCriteria:SearchCriteria, success: @escaping (_ response: Any) -> Void, failure: @escaping (_ error: Error?) -> Void ) {

        let parameters = parametersForQuery(searchCriteria: searchCriteria)

        Alamofire.request("http://api.nestoria.co.uk/api", parameters:parameters).responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success(let JSON):
                    print("Validation Successful")
                    print(response.data ?? "Data is empty")
                    success(JSON)
                case .failure(let error):
                    print(error)
                    failure(error)
                }
        })
    }

    private func parametersForQuery(searchCriteria:SearchCriteria) -> [String : Any]{
        var queryParameters = [
            "country": "uk",
            "pretty": "1",
            "encoding": "json",
            "listing_type": "buy",
            "action": "search_listings",
            "page": 1
            ] as [String : Any]
        if (searchCriteria.placeName != nil) {
            queryParameters["place_name"] = searchCriteria.placeName
        }
        if(searchCriteria.centerPoint != nil) {
            queryParameters["centre_point"] = searchCriteria.centerPoint
        }
        
        return queryParameters
    }
    
}
