//
//  DetailServiceView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct DetailServiceView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @State private var isAnimated = false
    
    let service: Service

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: service.logo!)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .opacity(isAnimated ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: self.isAnimated)
                    .onAppear {
                        self.isAnimated.toggle()
                    }
                
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)

            List(service.shows) { show in
                Button {
                    appCoordinator.presentSheet(.detailShow(named: show))
                } label: {
                    HStack {
                        Image(systemName: "tv")

                        Text(show.name)
                            .font(.title3)
                            .fontDesign(.rounded)
                    }
                    .foregroundStyle(.black)
                }
            }
            .opacity(isAnimated ? 1 : 0)
            .scaleEffect(isAnimated ? 1 : 0, anchor: .top)
            .animation(.easeInOut.delay(1), value: isAnimated)
        }
        //.navigationTitle(service.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Go Home") {
                    appCoordinator.popToRoot()
                }
            }
        }
    }
}

#Preview {
    DetailServiceView(service: .servicesMockup[0])
}
