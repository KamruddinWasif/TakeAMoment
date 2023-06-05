import SwiftUI

struct BreathingView: View {
    @Binding var isBreathing: Bool
    @State private var breathPhase = 0
    @State private var remainingTime = 0
    @State private var breathTimer: Timer? = nil
    
    let phases = [
        ("Inhale", 5),
        ("Hold", 5),
        ("Exhale", 5),
        ("Rest", 5)
    ]
    
    var body: some View {
        VStack {
            Text(phases[breathPhase].0)
                .font(.largeTitle)
                .padding()
            
            BreathingAnimationView()
            
            Button(action: {
                breathTimer?.invalidate()
                isBreathing = false
            }) {
                Text("Stop")
                    .padding()
            }
        }
        .onAppear {
            startBreathing()
        }
        .onDisappear {
            breathTimer?.invalidate()
        }
    }
    
    func startBreathing() {
        remainingTime = phases[breathPhase].1
        breathTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                breathPhase = (breathPhase + 1) % phases.count
                remainingTime = phases[breathPhase].1
                if breathPhase == 0 {
                    timer.invalidate()
                    isBreathing = false
                }
            }
        }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(isBreathing: .constant(true))
    }
}
