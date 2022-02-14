//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by dev jin on 2022/02/14.
//

import Foundation

enum movieAPIType {
    case onlyUrl(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum MovieAPIError: Error {
    case badURL
}

class NetworkLayer {

    // only url
    // url + param
    
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    func request(type: movieAPIType, completion: @escaping NetworkCompletion) {

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do{
            let request = try buildReqeust(type: type)
             
            // 클로저
            session.dataTask(with: request) { data, response, error in
                print( (response as! HTTPURLResponse).statusCode )
                    
                completion(data, response, error)
                
                // 실행한다.
            }.resume()
            session.finishTasksAndInvalidate()
        
        }catch {
            print(error)
        }
    }
    
    private func buildReqeust(type: movieAPIType) throws -> URLRequest {
       
        switch type {
        case .onlyUrl(urlString: let urlString):
           
            guard let hasURL = URL(string: urlString) else {
                // 못가져왔을때 error
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
        
            
        case .searchMovie(querys: let querys):
            
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = querys
            
            guard let hasURL = components?.url else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
            
        }
        
        // case .....
    }
}


