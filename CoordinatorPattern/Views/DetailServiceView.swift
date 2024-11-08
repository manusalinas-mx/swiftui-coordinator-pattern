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
    @State private var selectedShowID: UUID? = nil // ID de la tarjeta seleccionada para el rebote

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
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]

                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(service.shows) { show in
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: URL(string: show.picUrl!)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 250)

                            // Name
                            VStack(alignment: .leading) {
                                Text(show.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)

                                Text(show.info)
                                    .font(.footnote)
                                    .foregroundStyle(.white.opacity(0.7))
                                    .lineLimit(2)
                            }
                            .padding(.all, 5)
                            .frame(maxWidth: .infinity)
                            .fontDesign(.rounded)
                            .background(Color.black.opacity(0.5).blur(radius: 5))
                        }
                        .cornerRadius(5)
                        .scaleEffect(selectedShowID == show.id ? 0.95 : 1.0) // Escala solo para la tarjeta seleccionada
                        .animation(selectedShowID == show.id ? .spring(response: 0.3, dampingFraction: 0.6) : .default, value: selectedShowID) // Animación de rebote solo para la seleccionada
                        .onTapGesture {
                            // Asigna el ID de la tarjeta seleccionada
                            selectedShowID = show.id


                            // Llama al método después de un pequeño retraso para permitir que la animación de rebote ocurra antes de presentar la vista
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                // Restablece el estado
                                selectedShowID = nil
                                appCoordinator.presentSheet(.detailShow(named: show))
                            }
                        }
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                .offset(x: phase.isIdentity ? 0 : 10)
                        }
                    }
                }
                .padding()
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
    DetailServiceView(service: .servicesMockup[1])
}
