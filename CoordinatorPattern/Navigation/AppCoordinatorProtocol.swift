//
//  AppCoordinatorProtocol.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    func push(_ screen:  Screen)
    func presentSheet(_ sheet: Sheet)
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

// MARK: Enums
enum Screen: Identifiable, Hashable {
    case home
    case listServices
    case detailService(named: Service)

    var id: Self { return self }
}

enum Sheet: Identifiable, Hashable {
    case detailShow(named: Show)

    var id: Self { return self }
}

enum FullScreenCover: Identifiable, Hashable {
    case addService(onSaveButtonTap: ((Service) -> Void))

    var id: Self { return self }
}

extension FullScreenCover {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .addService:
            hasher.combine("addService")
        }
    }

    // Conform to Equatable
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.addService, .addService):
            return true
        }
    }
}


