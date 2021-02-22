import SwiftUI

struct WorkoutPlayerView: View {
    let workout: Workout

    var body: some View {
        VStack {
            Text("Workout Player").font(.largeTitle)
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Text("(To be developed)")
        }
    }
}

#if DEBUG
struct WorkoutPlayer_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlayerView(workout: .sample)
    }
}
#endif
