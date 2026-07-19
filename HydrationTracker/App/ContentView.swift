import SwiftUI

struct ContentView: View {
    @State private var showingPlusSheet = false

    var body: some View {
        ZStack {
            TabView {
                HomeScreen()
                    .tabItem { Label("Home", systemImage: "house") }
                HistoryScreen()
                    .tabItem { Label("History", systemImage: "clock.arrow.circlepath") }
                InsightScreen()
                    .tabItem { Label("Insights", systemImage: "chart.bar.xaxis") }
                SettingScreen()
                    .tabItem { Label("Settings", systemImage: "gearshape") }
            }

            // Floating "Log Drink" action
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showingPlusSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(width: 56, height: 56)
                            .background(Color.accentColor, in: Circle())
                            .shadow(radius: 6, y: 3)
                    }
                    .accessibilityLabel("Log Drink")
                    .padding(.trailing, 20)
                    .padding(.bottom, 90)
                }
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showingPlusSheet) {
            PlusSheetView()
                .presentationDetents([.medium, .large])
                .presentationBackground(.regularMaterial)
        }
    }
}

#Preview {
    ContentView()
        .environment(AppRouter())
}
