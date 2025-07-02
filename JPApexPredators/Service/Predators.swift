//
//  Predators.swift
//  JPApexPredtators
//
//  Created by Júlio Andherson de Oliveira Silva on 13/06/25.
//

import Foundation

class Predators {
    var allApexPredators: [ApexPredator] = []
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
                self.allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                self.apexPredators = self.allApexPredators
            } catch {
                print("Failed to decode: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        return searchTerm.isEmpty ? apexPredators : apexPredators.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort {
            alphabetical ? $0.name < $1.name : $0.id < $1.id
        }
    }
    
    func filter(by type: APType) {
        apexPredators = type == .all ? allApexPredators : allApexPredators.filter( {$0.type == type} )
    }
}
