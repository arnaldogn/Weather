//
//  CityViewController.swift
//  Weather
//
//  Created by Arnaldo on 14/05/2022.
//

import Foundation
import UIKit

protocol CityViewControllerDelegate: AnyObject {
    func didSelectCity(_ location: Location)
}

class CityViewController: UITableViewController {
    var locations: [Location] = []
    weak var delegate: CityViewControllerDelegate?
    weak var coordinator: AppCoordinator?
    var viewModel: CityViewModel?
    
    override func viewDidLoad() {
        viewModel?.locations.bind { [weak self] locations in
            self?.locations = locations ?? []
            self?.tableView.reloadData()
        }
        
        let server = Server(clients: [])
        let client = Client(server: server)
        
        server.clients.append(client)
        
//        server.add(client: client)
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell")
        cell?.textLabel?.text = locations[indexPath.row].name
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.changeLocation(locations[indexPath.row])
        dismiss(animated: true)
    }
}

extension CityViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        viewModel?.fetchCity(text)
    }
}
