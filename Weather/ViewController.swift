//
//  ViewController.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forecastSummary: UILabel!
    private let viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.forecastSummary.bind {  [weak self] forecast in
            self?.forecastSummary.text = forecast
            print(forecast)
        }
        
        // Do any additional setup after loading the view.
    }


}

