//
//  HomeBuilder.swift
//  Today
//
//  Created by Gokhan Namal on 16.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class HomeBuilder: HomeBuilderProtocol {
    static func make() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Home", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! HomeViewController
        let presenter = HomePresenter(view: viewController)
        let worker = MainWorker()
        let userDefaultsWorker = UserDefaultsWorker()
        let interactor = HomeInteractor(worker: worker, userDefaultsWorker: userDefaultsWorker, presenter: presenter)
        
        viewController.interactor = interactor
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
