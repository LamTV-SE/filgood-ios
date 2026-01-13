//
//  ProductDetailViewModel.swift
//  filgood-native
//
//  Created by Van Lam on 13/1/26.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var productDetail: Product?
    
    static var productDetailCache: [Int: Product] = [:]
    static var loadingStates: [Int: Bool] = [:]
    
    func getProductDetail(id: Int) {
        if let cached = Self.productDetailCache[id] {
            self.productDetail = cached
        }
        
        if Self.loadingStates[id] == true {
            return
        }
        
        Self.loadingStates[id] = true
        isLoading = true
        errorMessage = nil
        
        WebService.shared.getJSON(path: APIEndpoint.prodeuctDetail.path + "/\(id)") { [weak self] (result: Result<APIResponse<Product>, Error>) in
            guard let self = self else { return }
            self.isLoading = false
            Self.loadingStates[id] = false
            
            switch result {
            case .success(let res):
                guard let data = res.data else {
                    self.errorMessage = res.message ?? "Missing data"
                    return
                }
                
                DispatchQueue.main.async {
                    Self.productDetailCache[id] = data
                    self.productDetail = data
                }
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
            }
        }
    }
}
