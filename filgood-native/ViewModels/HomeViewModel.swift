//
//  HomeViewModel.swift
//  filgood-native
//
//  Created by Van Lam on 13/1/26.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var nearByProducts: [Product] = []
    @Published var topPurchaseProducts: [Product] = []
    
    func getProductHome() {
        isLoading = true
        errorMessage = nil
        
        WebService.shared.getJSON(path: APIEndpoint.productsHome.path) { [weak self] (result: Result<APIResponse<ProductsHomeResponse>, Error>) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let res):
                guard let data = res.data else {
                    self.errorMessage = res.message ?? "Missing data"
                    print("Error", res.message ?? "Missing data")
                    return
                }
                
                DispatchQueue.main.async {
                    self.nearByProducts = data.nearbyProducts
                    self.topPurchaseProducts = data.topPurchaseProducts
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
            }
        }
    }
}

