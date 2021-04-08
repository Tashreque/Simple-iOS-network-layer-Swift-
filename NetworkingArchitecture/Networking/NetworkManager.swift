//
//  NetworkManager.swift
//  NetworkingArchitecture
//
//  Created by Tashreque Mohammed Haq on 8/4/21.
//

import Foundation

class NetworkManager {
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        // Set a URL component from
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.queryItems = endpoint.parameters
        components.host = endpoint.baseUrl
        components.path = endpoint.path
        
        // Get constructed URL from component.
        guard let url = components.url else { return }
        
        // Form the URL Request.
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        // Start a URL session.
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // Check if there is a server error.
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error!")
                return
            }
            
            // Check if the response is properly obtained.
            guard response != nil, let data = data else { return }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
