//
//  ViewController.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var forecastSummary: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var currentTemperature: UILabel!
    
    var viewModel: WeatherViewModel?
    weak var coordinator: AppCoordinator?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.forecastSummary.bind {  [weak self] forecast in
            self?.forecastSummary.text = forecast
        }
    
        viewModel?.icon.bind {  [weak self] icon in
            self?.icon.image = icon
        }
        
        viewModel?.currentTemperature.bind { [weak self] temp in
            self?.currentTemperature.text = temp
        }
        
        viewModel?.cityName.bind(listener: { [weak self] name in
            self?.cityButton.setTitle(name, for: .normal)
        })
    }
    
    @IBAction func chooseCity(_ sender: Any) {
        coordinator?.goToCitySelection()
    }
}
