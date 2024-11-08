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
        .padding(.all, 1)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 1, x: 1, y: 0.5)
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
