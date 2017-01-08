//
//  AppReducer.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 04/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//
import ReSwift

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            isLoading:loadingReducer(state?.isLoading, action: action),
            errorMessage:errorMessageReducer(state?.errorMessage, action: action),
            property:propertyReducer(state?.property, action: action)
        )
    }

    func loadingReducer(_ state: Bool?, action: Action) -> Bool {
        var state = state ?? false

        switch action {
        case _ as StartLoading:
            state = true
        case _ as EndLoading:
            state = false
        default:
            break
        }
        
        return state
    }

    func errorMessageReducer(_ state: String?, action: Action) -> String {
        var state = state ?? ""

        switch action {
        case let action as SaveErrorMessage:
            state = action.errorMessage
        case _ as CleanErrorMessage:
            state = ""
        default:
            break
        }

        return state
    }

    func propertyReducer(_ state: PropertyState?, action: Action) -> PropertyState {
        var state = state ?? PropertyState()

        switch action {
        case let action as UpdateSearchCriteria:
            state.searchCriteria = action.searchCriteria
        case let action as UpdateProperties:
            let responseData = action.response as! NSDictionary
            let response = responseData.object(forKey: "response") as! NSDictionary
            let propertyList = response.object(forKey: "listings") as! NSArray

            state.properties = propertyList.map({ (property) -> PropertyDetail in
                let props = property as! NSDictionary

                return PropertyDetail(
                    title:props.object(forKey: "title") as! String,
                    price:props.object(forKey: "price") as! Double,
                    imgUrl:props.object(forKey: "img_url") as! String
                )
            })
        default:
            break
        }

        return state
    }
}
