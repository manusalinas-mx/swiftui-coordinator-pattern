//
//  AddServiceView.swift
//  CoordinatorPattern
//
//  Created by Manuel Salinas on 9/19/24.
//

import SwiftUI

struct AddServiceView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator

    @State private var serviceName: String = ""
    @State private var serviceShows: [Show] = []

    @State private var newShowName: String = ""
    @State private var newShowinfo: String = ""

    let onSaveButtonTap: ((Service) -> Void?)

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Service Details")) {
                    TextField("Service Name", text: $serviceName)
                        .autocorrectionDisabled()
                }

                if !serviceShows.isEmpty {
                    Section(header: Text("Shows")) {
                        ForEach(serviceShows) { show in
                            VStack(alignment: .leading) {
                                Text(show.name)
                                    .font(.headline)

                                Text(show.info)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteTask)
                    }
                }

                Section(header: Text("Add Show")) {
                    TextField("Show Name", text: $newShowName)
                        .autocorrectionDisabled()

                    TextField("Info", text: $newShowinfo)
                        .autocorrectionDisabled()

                    Button("Add New Show", systemImage: "plus") {
                        addTask()
                    }
                    .disabled(newShowName.isEmpty || newShowinfo.isEmpty)
                    .foregroundStyle(newShowName.isEmpty && newShowinfo.isEmpty ? Color.secondary : Color.accentColor)
                }
            }
            .navigationTitle("Add Service")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        appCoordinator.dismissFullScreenOver()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: saveHabit) {
                        Text("Save")
                    }
                    .disabled(serviceName.isEmpty || serviceShows.isEmpty)
                }
            }
        }
    }

    // MARK: Functions
    private func addTask() {
        let newShow = Show(
            name: newShowName,
            info: newShowinfo,
            picUrl: "https://img.freepik.com/premium-vector/modern-design-concept-no-image-found-design_637684-247.jpg"
        )

        serviceShows.append(newShow)

        // Clean fields
        newShowName = ""
        newShowinfo = ""
    }

    private func deleteTask(at offsets: IndexSet) {
        serviceShows.remove(atOffsets: offsets)
    }

    private func saveHabit() {
        let newService = Service(
            name: serviceName,
            logo: "https://as2.ftcdn.net/v2/jpg/01/68/01/87/1000_F_168018748_qmW17F6anXnw8ah9odplfSBQfXXyD9cu.jpg",
            favIcon: "https://static.vecteezy.com/system/resources/thumbnails/007/104/553/small_2x/search-no-result-not-found-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
            shows: serviceShows
        )

        onSaveButtonTap(newService)
        appCoordinator.dismissFullScreenOver()
    }
}

#Preview {
    AddServiceView(onSaveButtonTap: { _ in })
}
