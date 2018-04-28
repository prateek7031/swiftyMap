//
//  ServiceFactory.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Alamofire

class ServiceFactory: NSObject {
    
    static let shared = ServiceFactory()
    private var sessionManager: SessionManager?
    
    class func  postMethod(url: String, parameters: Parameters,completion : @escaping (_ response: ServiceResponse) -> ()) -> Void
    {
            //do with post method to send data to server
    }
    
    class func  putMethod(url: String, parameters: Parameters,completion : @escaping (_ response: ServiceResponse) -> ()) -> Void
    {
        //do with put method to update
    }
    
    class func  getMethod(url: String,completion : @escaping (_ response: ServiceResponse) -> ()) -> Void {
        print("hostUrl is \(url)")
        //setting cookie
        
        Alamofire.request(url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default)
            .responseJSON { response in
                DispatchQueue.main.async {
                    let serviceResponse = ServiceResponse(response: response)
                    completion(serviceResponse)
                    print("response is \(response)")
                }
        }
        
    }
    
    class func  deleteMethod(url: String, parameters: Parameters,completion : @escaping (_ response: ServiceResponse) -> ()) -> Void
    {
        //delete method
    }
    
}

class OAuth2Handler: RequestAdapter, RequestRetrier {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?, _ refreshToken: String?) -> Void
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    private let lock = NSLock()
    
    
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    
    
    // MARK: - RequestAdapter
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        return urlRequest
    }
    
    // MARK: - RequestRetrier
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        //        print("if need retry");
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)
        } else {
            completion(false, 0.0)
        }
    }
    
}
