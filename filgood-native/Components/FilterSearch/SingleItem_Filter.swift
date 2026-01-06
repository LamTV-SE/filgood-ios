
import SwiftUI

struct SingleItem_Filter: View {
    let label: String
    let isColor: Bool
    let color: String
    
    @Binding var isChecked: Bool
    
    init(label: String, isColor: Bool = false, color: String = AppColor.white, isChecked: Binding<Bool>) {
        self.label = label
        self.isColor = isColor
        self.color = color
        self._isChecked = isChecked
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if isColor == true {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(hex: color))
                    .stroke(Color(hex: color == AppColor.white ? "#DBDBDB" : color), lineWidth: 1)
                    .frame(width: 20, height: 20)
            }
            Text(label)
                .font(.customFont(name: FontName.raleway, size: 14, weightValue: isChecked == true ? 600 : 400))
                .foregroundColor(Color(hex: AppColor.textBlack))
            Spacer()
            CheckCircleCustomView(isChecked: $isChecked) }
        .padding(.vertical, 19)
        .contentShape(Rectangle())
        .onTapGesture {
            isChecked.toggle()
        }
    }
}


#Preview {
    @Previewable @State var isChecked = false
    SingleItem_Filter(label: "Phildar", isColor: true, color: "#804C4C", isChecked: $isChecked)
        .padding(.horizontal, 15)
}
