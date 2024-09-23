//
//  HomeView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @State private var isAnimated = false
    @State private var jumpAnimation = false

    var body: some View {
        ZStack {

            Color.indigo.opacity(0.1)
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaleEffect(isAnimated ? 1 : 0, anchor: .center)
                    .animation(.default, value: isAnimated)

                Text("Home Screen")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .scaleEffect(isAnimated ? 1 : 0, anchor: .center)
                    .animation(.default.delay(0.5), value: isAnimated)

                Spacer()
                
                Button("Go to Habit List") {
                    appCoordinator.push(.listServices)
                }
                .buttonStyle(.bordered)
                .clipShape(.capsule)
                .tint(.indigo)
                .opacity(isAnimated ? 1 : 0)
                .animation(.easeInOut, value: isAnimated)

                Spacer(minLength: 40)
            }
            .navigationTitle("Home")
            .foregroundStyle(.indigo)
            .scaleEffect(jumpAnimation ? 1.1 : 1, anchor: .center)
            .animation(.easeInOut, value: jumpAnimation)
        }
        .onAppear {
            // Jump animation every time Home Screen is appearing
            if isAnimated && !jumpAnimation {
                withAnimation {
                    jumpAnimation = true
                } completion: {
                    jumpAnimation = false
                }

            }

            // Animation just for 1st time
            isAnimated = true
        }
    }
}

#Preview {
    HomeView()
}
