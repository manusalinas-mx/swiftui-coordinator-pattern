//
//  ServiceListView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct ServiceListView: View {
    @State private var services: [Service] = Service.servicesMockup
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @State private var isAnimated = false

    var body: some View {
        List {
            ForEach(services) { service in
                Button {
                    appCoordinator.push(.detailService(named: service))
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: service.favIcon!)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .opacity(isAnimated ? 1 : 0)
                                .animation(.easeInOut(duration: 1), value: self.isAnimated)
                                .onAppear {
                                    self.isAnimated = true
                                }

                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 25, height: 25)

                        Text(service.name)
                            .fontWeight(.semibold)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                }
                .tint(.black)
            }
        }
        .navigationTitle("Streaming List")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus") {
                    appCoordinator.presentFullScreenCover(.addService(onSaveButtonTap: { newService in
                        services.append(newService)
                    }))
                }
            }
        }
    }
}

#Preview {
    ServiceListView()
}
