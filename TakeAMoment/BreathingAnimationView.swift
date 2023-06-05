import SwiftUI

struct BreathingAnimationView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(0..<20) { item in
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: CGFloat(item) * 20.0, height: CGFloat(item) * 20.0)
                        .scaleEffect(self.animate ? 1 : 0)
                        .opacity(self.animate ? 0.0 : 1.0)
                }
            }
            .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: false))
            .onAppear() {
                self.animate = true
            }
        }
    }
}

struct BreathingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingAnimationView()
    }
}
