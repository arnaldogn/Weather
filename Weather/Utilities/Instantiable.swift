//
//  Instantiable.swift
//  Weather
//
//  Created by Arnaldo on 15/05/2022.
//

import UIKit

protocol Instantiable: UIViewController {
    static func instantiate(_ storyboard: String) -> Self
}

extension Instantiable {
    static func instantiate(_ storyboard: String = "Main") -> Self {
        let storyboard = UIStoryboard.init(name: storyboard, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
        
    }
}

extension ViewController: Instantiable {}
extension CityViewController: Instantiable {}
