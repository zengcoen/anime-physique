import SwiftUI
struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search characters...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Spacer()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
