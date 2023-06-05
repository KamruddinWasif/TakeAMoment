import SwiftUI

struct ContentView: View {
    @State private var isBreathing = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if isBreathing {
                BreathingView(isBreathing: $isBreathing)
            } else {
                Button(action: {
                    isBreathing = true
                }) {
                    Text("Help me calm down")
                        .font(.largeTitle)
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
