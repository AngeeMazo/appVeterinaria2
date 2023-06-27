//
//  APIService.swift
//  VeterinariaLasCondes
//
//  Created by Angee Mazo on 30/05/23.
//

import Foundation

protocol APIServiceInterface {
    func fetchData<T: Decodable>(from url: URL,
                                 email: String,
                                 password: String,
                                 islogin: Bool,
                                 idRegistro: Int?,
                                 completion: @escaping (Result<T, Error>) -> Void)
    
}

class APIService: APIServiceInterface {
    
    init() {}
    
    func fetchData<T: Decodable>(from url: URL,
                                 email: String,
                                 password: String,
                                 islogin: Bool,
                                 idRegistro: Int?,
                                 completion: @escaping (Result<T, Error>) -> Void) {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        if islogin {
            components.queryItems = [
                URLQueryItem(name: "email", value: email),
                URLQueryItem(name: "contrasena", value: password)
            ]
        } else {
            components.queryItems = [
                URLQueryItem(name: "idRegistro", value: String(idRegistro ?? 0))
            ]
        }
        
        
        guard let urlWithParams = components.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: urlWithParams) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            DispatchQueue.main.sync {
                do {
                    if let str = String(data: data, encoding: .utf8) {
                            print("Datos recibidos: \(str)")
                        }
                    
                    let decoder = JSONDecoder()
                    let apiResponse = try decoder.decode(T.self, from: data)
                    
                    completion(.success(apiResponse))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
}
