//
//  CoordinatorView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct CoordinatorView: View {
    @State var appCoordinator = AppCoordinator()

    init() {
       setupNavigationBarAppearance()
    }

    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.home) // <- Define your root screen
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
                .sheet(item: $appCoordinator.sheet) { sheet in
                    appCoordinator.build(sheet)
                        .presentationDetents([.medium, .large])
                        .presentationCornerRadius(20)
                        .presentationDragIndicator(.visible)
                }
                .fullScreenCover(item: $appCoordinator.fullScreenCover) { fullScreenCover in
                    appCoordinator.build(fullScreenCover)
                }

        }
        .tint(.white)
        .environmentObject(appCoordinator)
    }

    func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemIndigo
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
}

#Preview {
    CoordinatorView()
}
