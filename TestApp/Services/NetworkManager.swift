//
//  NetworkManager.swift
//  TestApp
//
//  Created by Vadim on 24.05.2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchCurrencyData(currency: String, completion: @escaping (Result<CurrencyModel, Error>) -> Void) {
        let url = "https://data.messari.io/api/v1/assets/\(currency)/metrics"
        print(url)
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "No data or invalid response", code: 0)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                let error = NSError(domain: "Server error", code: response.statusCode)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let currencyModel = try decoder.decode(CurrencyModel.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(currencyModel))
                }
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
