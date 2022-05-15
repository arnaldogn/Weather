//
//  AppCoordinator.swift
//  Weather
//
//  Created by Arnaldo on 15/05/2022.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    lazy var weatherViewModel = WeatherViewModel(service: WeatherService())

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToMainScreen()
    }
    
    func goToCitySelection() {
        let viewController = CityViewController.instantiate()
        viewController.coordinator = self
        viewController.viewModel = CityViewModel()
        navigationController.present(viewController, animated: true)
    }
    
    func changeLocation(_ location: Location) {
        weatherViewModel.changeLocation(location)
    }
    
    func goToMainScreen() {
        let viewController = ViewController.instantiate()
        viewController.viewModel = weatherViewModel
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
