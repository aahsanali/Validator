//
//  NetworkManager.swift
//  4ARTLogin
//
//  Created by Coeus on 21/11/2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()

    private let appApiKey = "CJRP9OP6X08N1JBLQ1TSAGJKHYR8MER5"
    
    private var mustHaveParams : [String : String] {
        
        return [ "app_version" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "",
                 "locale" : "en" ,
                 "user_id" : "0",
                 "company_id" : "0",
                 "mode" : "0",
                 "os" : "iOS",
                 "app" : "4ART"]
        
    }
    
    
    private var mustHaveParamsInHeader : [String : String] {
        return [
            "app_version" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "",
            "device-name" : "iPhone (iPhone13,2)",
            "locale" : "en"
        ]
    }
    
    private let otherParams = [
        "locale" : "en"
    ]
    
    
    func sendPostRequest(_ url: String, parameters: [String: String], headers: [String: String] = [:], addOtherParams : Bool = true, onComplete: @escaping ((Data?, URLResponse?, Error?)->Void)) {
        var urlStr = url
        
        var queryParams = "?"
        for (key, val) in mustHaveParams {
            queryParams += "&\(key)=\(val)"
        }
        urlStr = url + queryParams
        
        guard let url = URL(string: urlStr) else {
            onComplete(nil, nil, nil)
            return
        }
        
        var parameters = parameters
        var headers = headers
        
        if addOtherParams {
            for (key, val) in otherParams {
                parameters[key] = val
            }
        }
        
        for (key, val) in mustHaveParams {
            parameters[key] = val
        }
        
        //        print(parameters)
        
        let data = try? JSONEncoder().encode(parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        headers.merge(dict: mustHaveParamsInHeader)
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        request.setValue("Bearer 5e60dcfada6c64d2ad3e40e035780da95a479d16346a87d1a4bc5001146330e7", forHTTPHeaderField: "Authorization")
        request.setValue(appApiKey, forHTTPHeaderField: "appApiKey")
        
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.startURLSession(request: request, onComplete: onComplete);
    }
    
    func startURLSession(request: URLRequest, onComplete: @escaping ((Data?, URLResponse?, Error?)->Void)) {
        
        let startTime = Date()
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["User-Agent": "iOS"]
        let session = URLSession(configuration: config)
        session.sessionDescription = "4ARTAPI Session"
        
        session.dataTask(with: request) { (data, response, error) in
            
            if data != nil {
                
                // API Response loggin
                self.apiTimeLoger(request: request, data: data!, startTime: startTime, showFull: true)
            }
            onComplete(data, response, error);
            
        }.resume()
    }
    
    
    func apiTimeLoger(request: URLRequest, data:Data, startTime:Date, showFull:Bool = false){
        print("### API -  \(request.url?.absoluteString ?? "null invalid url string") ###")
        
        if showFull {
            if let requestHeader = request.allHTTPHeaderFields{
                print("Header : \(String(describing: requestHeader))")
            }
            if let body = request.httpBody {
                print("Body : \(String(decoding: body, as: UTF8.self))")
            }
            print(String(data: data, encoding: String.Encoding.utf8) ?? "failed to convert to string");
        }
        print("STARTED AT  : \(startTime)")
        print("RESPONDED AT: \(Date())")
        print("TOTAL TIME  : \(Int(Date().timeIntervalSince(startTime))) sec")
    }
    
}








extension Dictionary {
    
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}


