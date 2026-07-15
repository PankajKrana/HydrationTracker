//
//  ReusableButton.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct ReusableButton: View {
    let title: String
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(foregroundColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(backgroundColor)
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

struct SocialLoginButton<Icon: View>: View {
    let action: () -> Void
    @ViewBuilder let icon: () -> Icon

    var body: some View {
        Button(action: action) {
            icon()
                .frame(width: 24, height: 24)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 10)
        }
    }
}


struct BreakerView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 0.5)
            Text("OR")
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 0.5)

        }
        .padding()
        .foregroundStyle(.gray)

    }
}


struct IconView: View {
    @State var iconImage: ImageResource
    var body: some View {
        Image(iconImage)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}


struct SideImageView: View {
    var mirrored = false
    var width: CGFloat = 150
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0

    var body: some View {
        Image(.side)
            .resizable()
            .scaledToFit()
            .frame(width: width)
            .scaleEffect(x: mirrored ? -1 : 1, y: 1)
            .offset(x: xOffset, y: yOffset)
    }
}



struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField(
            "",
            text: $email,
            prompt: Text("example@youremail.com")
                .foregroundStyle(.gray)
        )
//        .foregroundStyle(.primary)
        .padding()
        .background(.gray.opacity(0.2))
        .clipShape(Capsule())

    }
}

struct PasswordTextField: View {
    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(Capsule())
    }
}


struct SkipButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Skip")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(.white.opacity(0.9))
                .clipShape(Capsule())
        }
    }
}



struct CustomBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action){

            Circle()
                .fill(.white.opacity(0.9))
                .frame(width: 42,height: 42)
                .overlay {

                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
        }
    }
}
