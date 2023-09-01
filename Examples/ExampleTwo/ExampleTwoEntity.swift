//
//  ExampleTwoEntity.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//

import Foundation

struct Products: Codable {
    let success: Bool?
    let message: String?
    let data: ProductDataList?
}

struct ProductDataList: Codable {
    let data: [ProductData]?
}

struct ProductData: Codable {
    let user_plan: String?
    let activity_views: Int?
    let id: Int?
}
