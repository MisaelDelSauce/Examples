//
//  ExampleFourEntity.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//

import Foundation

struct Locations: Codable {
    let data: [Location]?
}

struct Location: Codable {
    let state: String?
    let latitude: Double?
    let longitude: Double?
}
