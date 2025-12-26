//
//  ProductDetailView.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Int
    let namespace: Namespace.ID
    let onClose: () -> Void
    
    @State private var animateContent = false
    @State private var currentImage: Int? = 0
    
    private let screenWidth = UIScreen.main.bounds.width
    private let totalImages = 3
    private let images: [String] = ["https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", "https://api.ia-arena.ruji.fr/storage/fakes/fake_7.jpeg", "https://api.ia-arena.ruji.fr/storage/profile_pictures/eLZ8StTyTHGTxmey8srJqp4t6xu6YchqL4rYD4az.jpg"]
    
    var body: some View {
        VStack(spacing: 0) {
            headerView()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 11) {
                    Spacer().frame(height: 18)
                    titleAndQuantityView()
                    informationView()
                }
            }
            .zIndex(12)
            .padding(.top, 0)
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .clipShape(
                .rect(
                    topLeadingRadius: 20,
                    topTrailingRadius: 20
                )
            )
            .offset(x: animateContent ? 0 : screenWidth, y: 0)
            .opacity(animateContent ? 1 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .safeAreaInset(edge: .bottom, content: {
            VStack(spacing: 0) {
                Divider().background(Color(hex: "#E9E9E9"))
                    .frame(maxWidth: .infinity)
                ButtonCustomView(title: "Acheter")
                    .padding(.top, 13)
                    .padding(.bottom, 50)
                    .padding(.horizontal, 15)
                    .background(.white)
            }
        })
        .ignoresSafeArea(.all, edges: .vertical)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                animateContent = true
            }
        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                        ImageCustomView(url: image, width: screenWidth, height: 327, cornerRadius: 0)
                            .containerRelativeFrame(.horizontal)
                            .id(index)
                    }
                }
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $currentImage)
            .frame(height: 327)
            .padding(.bottom, -28)
            .matchedGeometryEffect(id: "product-image-\(product)", in: namespace)
            .transition(.opacity)
            
            HStack {
                Button {
                    onClose()
                } label: {
                    Image("arrowLeftWhite20")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .frame(width: 42, height: 42)
                .background(Color.black.opacity(0.3))
                .clipShape(Circle())
                Spacer()
                Button {
                    // to do favourite
                } label: {
                    Image("heart24")
                }
                .frame(width: 46, height: 46)
                .background(.white)
                .clipShape(Circle())
            }
            .padding(.top, 60)
            .padding(.horizontal, 15)
            HStack(spacing: 7) {
                ForEach(0..<totalImages, id: \.self) { index in
                    Capsule()
                        .fill(currentImage == index ? .white : .white.opacity(0.6))
                        .frame(width: currentImage == index ? 18 : 12, height: 6)
                        .animation(
                            .easeInOut(duration: 0.25),
                            value: currentImage
                        )
                }
            }
            .padding(.top, 283)
        }
        .zIndex(10)
    }
    
    @ViewBuilder
    private func titleAndQuantityView() -> some View {
        HStack {
            Text("Mohair Rose")
                .font(.customFont(name: FontName.raleway, size: 23, weightValue: 600))
                .foregroundStyle(Color(hex:  AppColor.textBlack))
            Spacer()
            Text("7€")
                .font(.customFont(name: FontName.raleway, size: 23, weightValue: 700))
                .foregroundStyle(Color(hex: AppColor.secondary))
        }
        HStack(spacing: 15) {
            HStack(spacing: 5) {
                Image("locationPinGreen16")
                Text("3 km")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                    .foregroundColor(Color(hex: "#333333"))
            }
            HStack(spacing: 5) {
                Image("paintGreen16")
                Text("Sauge")
                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                    .foregroundColor(Color(hex: "#333333"))
            }
            Spacer()
            HStack(spacing: 0) {
                Button {} label: {
                    Image("minusGreen24")
                }
                .frame(width: 34)
                Divider()
                    .background(Color(hex: "#E9E9E9"))
                    .frame(height: 34)
                Text("1")
                    .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                    .foregroundColor(Color(hex:  AppColor.textBlack))
                    .frame(width: 40)
                Divider()
                    .background(Color(hex: "#E9E9E9"))
                    .frame(height: 34)
                Button {} label: {
                    Image("plusGreen24")
                }
                .frame(width: 34)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
            }
        }
    }
    
    @ViewBuilder
    private func informationView() -> some View {
        Text("Lot de 3 pelotes Mohair couleur Sauge, bain #314. Jamais utilisées. Idéal pour un cardigan léger. Trocs bienvenus (alpaga gris, coton écru).")
            .font(.customFont(name: FontName.raleway, size: 14, weightValue: 400))
            .foregroundColor(Color(hex: "#7E7F7E"))
            .lineSpacing(3)
        VStack(spacing: 20) {
            HStack(spacing: 26) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Marque")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("Drops")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                }
                .frame(width: 134, alignment: .leading)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Matière")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("72% Mohair")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                }
                Spacer()
            }
            HStack(spacing: 26) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Poids")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("50g")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex:  AppColor.textBlack))
                }
                .frame(width: 134, alignment: .leading)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Remise")
                        .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                        .foregroundColor(Color(hex: "#7E7F7E"))
                    Text("Main propre ou envoi")
                        .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                        .foregroundColor(Color(hex: AppColor.textBlack))
                }
                Spacer()
            }
        }
        .padding(.leading, 20)
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
        }
        VStack(spacing: 29) {
            ButtonCustomView(title: "Contacter le vendeur")
            InformationOwner_ProductDetail()
            ReviewProduct_ProductDetail()
            PaymentView_ProductDetail()
            SimilarProduct_ProductDetail()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProductDetailView(
            product: 1,
            namespace: namespace,
            onClose: {}
        )
    }
}
