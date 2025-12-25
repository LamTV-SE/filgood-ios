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

class WebService {
    static let shared = WebService()
    private init() {}

    func request<T: Decodable>(urlString: String, medthod: HTTPMethod = .GET, body: Data? = nil, headers: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
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
