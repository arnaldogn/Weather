//
//  ViewController.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forecastSummary: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var currentTemperature: UILabel!
    
    private let viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.forecastSummary.bind {  [weak self] forecast in
            self?.forecastSummary.text = forecast
        }
    
        viewModel.icon.bind {  [weak self] icon in
            self?.icon.image = icon
        }
        
        viewModel.currentTemperature.bind { temp in
            self.currentTemperature.text = temp
        }
    }
}

