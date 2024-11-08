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
    @State private var isLargeDetent = false

    let show: Show

    var body: some View {
        GeometryReader { geometry in
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
                    .opacity(isLargeDetent ? 1 : 0)
                    .animation(.easeInOut, value: isLargeDetent)
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
            .onChange(of: geometry.size.height) { oldValue, newValue in
                print(newValue)
                updateDetentStatus(with: newValue)
            }
        }
    }

    private func updateDetentStatus(with height: CGFloat) {
           isLargeDetent = height > 600
       }
}

#Preview {
    DetailShowView(show: Service.servicesMockup[1].shows[1])
}
