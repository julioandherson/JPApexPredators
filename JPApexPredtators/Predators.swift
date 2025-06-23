//
//  Predators.swift
//  JPApexPredtators
//
//  Created by Júlio Andherson de Oliveira Silva on 13/06/25.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Failed to decode: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { (predator1, predator2) -> Bool in
            if alphabetical {
                return predator1.name < predator2.name
            } else {
                return predator1.id < predator2.id
            }
        }
    }
}
