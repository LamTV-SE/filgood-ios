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
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ZStack (alignment: .top) {
                    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: screenWidth, height: 327, cornerRadius: 0)
                        .padding(.bottom, 8)
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
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 15)
                }
                .zIndex(10)
                
                VStack(spacing: 11) {
                    Spacer().frame(height: 327)
                    HStack {
                        Text("Mohair Rose")
                            .font(.customFont(name: FontName.raleway, size: 23, weightValue: 600))
                            .foregroundStyle(Color(hex: "#040415"))
                        Spacer()
                        Text("7€")
                            .font(.customFont(name: FontName.raleway, size: 23, weightValue: 700))
                            .foregroundStyle(Color(hex: AppColor.secondary))
                    }
                    HStack(spacing: 15){
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
                            Button {
                                
                            } label: {
                                Image("minusGreen24")
                            }
                            .frame(width: 34)
                            Divider()
                                .background(Color(hex: "#E9E9E9"))
                                .frame(height: 34)
                            Text("1")
                                .font(.customFont(name: FontName.raleway, size: 15, weightValue: 600))
                                .foregroundColor(Color(hex: "#040415"))
                                .frame(width: 40)
                            Divider()
                                .background(Color(hex: "#E9E9E9"))
                                .frame(height: 34)
                            Button {
                                
                            } label: {
                                Image("plusGreen24")
                            }
                            .frame(width: 34)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "#E9E9E9"), lineWidth: 1)
                        }
                    }
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
                                    .foregroundColor(Color(hex: "#040415"))
                                
                            }
                            .frame(width: 134, alignment: .leading)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Matière")
                                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                    .foregroundColor(Color(hex: "#7E7F7E"))
                                Text("72% Mohair")
                                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                                    .foregroundColor(Color(hex: "#040415"))
                                
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
                                    .foregroundColor(Color(hex: "#040415"))
                                
                            }
                            .frame(width: 134, alignment: .leading)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Remise")
                                    .font(.customFont(name: FontName.raleway, size: 13, weightValue: 400))
                                    .foregroundColor(Color(hex: "#7E7F7E"))
                                Text("Main propre ou envoi")
                                    .font(.customFont(name: FontName.raleway, size: 14, weightValue: 500))
                                    .foregroundColor(Color(hex: "#040415"))
                                
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
                    Spacer()
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .offset(x: animateContent ? 0 : screenWidth)
                .opacity(animateContent ? 1 : 0)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                animateContent = true
            }
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
