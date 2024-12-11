import SwiftUI

struct NavBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            // Home Button
            Button(action: {
                selectedTab = 0
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(selectedTab == 0 ? .blue : .gray)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(selectedTab == 0 ? .blue : .gray)
                }
            }
            .frame(maxWidth: .infinity) // Ensure buttons take equal space

            // Form Button
            Button(action: {
                selectedTab = 1
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(selectedTab == 1 ? .blue : .gray)
                    Text("Form")
                        .font(.caption)
                        .foregroundColor(selectedTab == 1 ? .blue : .gray)
                }
            }
            .frame(maxWidth: .infinity) // Ensure buttons take equal space

            // Profile Button
            Button(action: {
                selectedTab = 2
            }) {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(selectedTab == 2 ? .blue : .gray)
                    Text("Profile")
                        .font(.caption)
                        .foregroundColor(selectedTab == 2 ? .blue : .gray)
                }
            }
            .frame(maxWidth: .infinity) // Ensure buttons take equal space
        }
        .padding(.vertical, 10)
        .background(Color(.systemGray6)) // Optional background color
    }
}
