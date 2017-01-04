//
//  ViewController.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 03/01/2017.
//

import UIKit
import ReSwift

class SearchViewController: UIViewController, StoreSubscriber {

    typealias StoreSubscriberStateType = AppState

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        mainStore.subscribe(self) { state in state }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }

    // MARK: State Updates
    func newState(state: AppState) {
        
    }

    @IBAction func searchByCity() {

    }

    @IBAction func searchByCurrentLocation() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

