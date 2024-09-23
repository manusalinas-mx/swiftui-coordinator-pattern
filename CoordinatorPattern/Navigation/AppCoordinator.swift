//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI
import Observation

@Observable
class AppCoordinator: AppCoordinatorProtocol {
    var path: NavigationPath = NavigationPath()
    var sheet: Sheet?
    var fullScreenCover: FullScreenCover?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenOver() {
        self.fullScreenCover = nil
    }

    // MARK: - Presentation Style Providers
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .home:
            HomeView()

        case .listServices:
            ServiceListView()

        case .detailService(named: let service):
            DetailServiceView(service: service)
        }
    }

    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .detailShow(named: let show):
            DetailShowView(show: show)
        }
    }

    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .addService(onSaveButtonTap: let onSave):
            AddServiceView(onSaveButtonTap: onSave)
        }
    }
}
