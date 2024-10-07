//
//  ContentCardView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/23/24.
//

import SwiftUI

struct ContentCardView<T: View>: View {

    @ViewBuilder let content: () -> T

    var body: some View {
        VStack {
            content()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 3, x: 2, y: 2)
        .scrollTransition { content, phase in
            content
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                .offset(x: phase.isIdentity ? 0 : 10)
        }
    }
}

#Preview {
    ContentCardView {
        Text("pedo")
    }
}
