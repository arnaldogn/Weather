//
//  RetainCycle.swift
//  Weather
//
//  Created by Arnaldo on 15/05/2022.
//

import Foundation

class Server {
    var clients: [Client] //Because this reference is strong
    
    init(clients: [Client]) {
        self.clients = clients
    }
    
    deinit {
        print("Server deinit")
    }
}

class Client {
    var server: Server? //And this one is also strong
    
    init(server: Server) {
        self.server = server
//        self.server?.clients.append(self) //This line creates a Retain Cycle -> Leak!
    }
    
    deinit {
        print("Client deinit")
    }
}
