import SwiftUI

struct IconView: View {
    @State var iconImage: ImageResource
    var body: some View {
        Image(iconImage)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}
