//
//  WebService.swift
//  filgood-native
//
//  Created by Van Lam on 25/12/25.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum APIEndpoint {
    case login
    case productsHome
    case prodeuctDetail
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .productsHome:
            return "/products/home-page"
        case .prodeuctDetail:
            return "/products"
        }
        
    }
}

class WebService {
    static let shared = WebService()
    let config = AppConfig()
    
    private init() {}
    
    private func makeURL(path: String) -> URL? {
        let fullPath = path.hasPrefix("/") ? path : "/\(path)"
        return URL(string: config.baseURL + fullPath)
    }
    
    func request<T: Decodable>(path: String, medthod: HTTPMethod = .GET, body: Data? = nil, headers: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = makeURL(path: path) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = medthod.rawValue
        request.httpBody = body
        
        // Add default token header
        if let token = AuthManager.shared.token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // Merge addition headers if have
        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                    return
                }
                
                guard let data else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                
                print("===== RAW RESPONSE =====")
                print(String(data: data, encoding: .utf8) ?? "NO DATA")
                print("========================")
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

extension WebService {
    func postJSON<T: Decodable, B: Encodable>(
        path: String,
        body: B,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let bodyData = try JSONEncoder().encode(body)

            request(
                path: path,
                medthod: .POST,
                body: bodyData,
                headers: ["Content-Type": "application/json"],
                completion: completion
            )
        } catch {
            completion(.failure(error))
        }
    }
    
    func getJSON<T: Decodable>(
            path: String,
            query: [String: String]? = nil,
            completion: @escaping (Result<T, Error>) -> Void
        ) {
            var finalPath = path
            
            if let query, !query.isEmpty {
                var components = URLComponents()
                components.path = path
                components.queryItems = query.map {
                    URLQueryItem(name: $0.key, value: $0.value)
                }
                finalPath = components.string ?? path
            }
            
            request(
                path: finalPath,
                medthod: .GET,
                completion: completion
            )
        }
}
