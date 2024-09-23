//
//  Show.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import Foundation

struct Show: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let info: String
    let picUrl: String?
}

