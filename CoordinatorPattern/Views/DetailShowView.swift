//
//  DetailShowView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct DetailShowView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @State private var isAnimated = false

    let show: Show

    var body: some View {
        ScrollView {

            ZStack {
                AsyncImage(url: URL(string: show.picUrl!)) { image in
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

                VStack {
                    HStack {
                        Spacer()
                        Button {
                            appCoordinator.dismissSheet()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                        }
                        .frame(width: 40, height: 40)
                        .tint(.white)
                        .shadow(color: .black.opacity(0.3), radius: 10)
                    }
                    .padding()

                    Spacer()
                }
                .opacity(isAnimated ? 1 : 0)
                .animation(.easeInOut.delay(1.5), value: isAnimated)
            }

            VStack {
                HStack {
                    Text(show.name)
                        .font(.system(size: 50, weight: .semibold, design: .rounded))
                        .padding(.leading, 10)
                    Spacer()
                }

                Spacer(minLength: 15)

                Text(show.info)
                    .font(.title2)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 10)

                Spacer(minLength: 50)
            }
            .opacity(isAnimated ? 1 : 0)
            .animation(.easeInOut.delay(1), value: isAnimated)

        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailShowView(show: Service.servicesMockup[1].shows[1])
}
