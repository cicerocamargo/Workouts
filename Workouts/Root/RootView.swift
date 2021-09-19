import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            workoutsTab
            settingsTab
        }
    }

    private var workoutsTab: some View {
        NavigationView(content: Composer.makeWorkoutsView)
            .tabItem {
                Text("Workouts")
                Image(systemName: "bolt.heart")
            }
    }

    private var settingsTab: some View {
        NavigationView(content: Composer.makeProfileView)
            .tabItem {
                Text("Profile")
                Image(systemName: "person.circle")
            }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
