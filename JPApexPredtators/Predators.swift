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
}
