import SwiftUI
import CoreMotion
import Combine



struct ContentView: View {
    @StateObject private var motionManager = MotionManager()

    var body: some View {
        VStack {

            if let activity = motionManager.activity {
                Text("Activity: \(activity.running == true ? "Running" : (activity.walking == true ? "Walking" : (activity.automotive == true ? "Automative" : "")))")
            }

            if let numberOfSteps = motionManager.numberOfSteps {
                Text("Number Of Steps: \(numberOfSteps)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
