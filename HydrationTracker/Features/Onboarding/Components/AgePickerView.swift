import SwiftUI

struct AgePickerView: View {

    @Binding  var age: Int

    var body: some View {

        VStack(spacing: 30) {

            HStack {
                Text("\(age)")
                    .font(.largeTitle)
                    .bold()

                Text("years")
                    .foregroundStyle(.secondary)
            }

            Picker("", selection: $age) {

                ForEach(1...100, id: \.self) { value in

                    Text("\(value)")
                        .font(.title)
                        .tag(value)

                }

            }
            .pickerStyle(.wheel)
//            .frame(height: 180)
//            .clipped()

        }
    }
}
