import SwiftUI

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
