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
            HStack {
                AsyncImage(url: URL(string: service.logo!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .opacity(isAnimated ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: self.isAnimated)
                        .onAppear {
                            self.isAnimated = true
                        }
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
            }
            .frame(maxWidth: .infinity)
            .background(.white)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(service.shows) { show in
                        ContentCardView {
                            HStack {
                                AsyncImage(url: URL(string: show.picUrl!)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)

                                VStack {
                                    Text(show.name)
                                        .font(.largeTitle)
                                        .fontDesign(.rounded)

                                    Spacer()
                                }
                                Spacer()
                            }
                            
                        }
                        .onTapGesture {
                            appCoordinator.presentSheet(.detailShow(named: show))
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .opacity(isAnimated ? 1 : 0)
            .scaleEffect(isAnimated ? 1 : 0, anchor: .top)
            .animation(.easeInOut.delay(1), value: isAnimated)
        }
        //.navigationTitle(service.name)
        .background(.indigo.opacity(0.1))
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
