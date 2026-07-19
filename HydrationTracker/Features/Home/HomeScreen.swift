//
//  HomeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(AppRouter.self) private var router
    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    headerView
                    
                    Spacer()
                    
                    waterIntakeView
                    
                    Spacer()
                    
                    
                    HStack(spacing: 10) {
                        RemaningConsistensyView(title: "Remaning", subTitle: "1.4L/3.6L")
                        
                        RemaningConsistensyView(title: "Consistency", subTitle: "12 days")
                        
                    }
                    
                    Spacer()
                    
                    Text("Today's Hydration")
                
                    InsertWaterIntakeView(title: "Evening Refile", intakeTime: "7:20 PM", intakeWater: "+300 ml")
                    
                    InsertWaterIntakeView(title: "Afternoon Refile", intakeTime: "8:00 PM", intakeWater: "+300 ml")
                    InsertWaterIntakeView(title: "Evening Refile", intakeTime: "7:20 PM", intakeWater: "+300 ml")
                    
                    InsertWaterIntakeView(title: "Afternoon Refile", intakeTime: "8:00 PM", intakeWater: "+300 ml")
                    InsertWaterIntakeView(title: "Evening Refile", intakeTime: "7:20 PM", intakeWater: "+300 ml")
                    
                    InsertWaterIntakeView(title: "Afternoon Refile", intakeTime: "8:00 PM", intakeWater: "+300 ml")

                    
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
    }
}

extension View {
    @ViewBuilder
    var headerView: some View {
        HStack {
            Image(systemName: "person")
                .font(.title2)
                .padding()
                .background(.regularMaterial)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Hello, Rohan")
                Text("Stay hydrated today")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            
            Button {
                // action
            } label: {
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(Circle())
            }

            
        }

    }
    
    @ViewBuilder
    var waterIntakeView: some View {
        HStack {
            Image(.waterBottle)
                .resizable()
                .scaledToFit()
                .frame(width: 240)
            
            VStack(alignment: .leading) {
                Text("Goal: 3.0L")
                
                Text("1.6L")
                    .font(.largeTitle)
                Text("Today's intake")
                
            }
        }

    }
}

struct RemaningConsistensyView: View {
    @State var title: String
    @State var subTitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)

            Text(subTitle)

            HStack {
                Spacer()

                Image(.side)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
            }
        }
        .padding(.leading, 16)
        .padding(.top, 16)
        .padding(.bottom, 16)
        .background(appBg)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct InsertWaterIntakeView: View {
    @State var title: String
    @State var intakeTime: String
    @State var intakeWater: String
    var body: some View {
        HStack {
            Image(.waterBottle)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            
            VStack(alignment: .leading) {
                Text(title)
                Text(intakeTime)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text(intakeWater)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(.rect)
    }
}

#Preview {
    HomeScreen()
        .environment(AppRouter())
}
