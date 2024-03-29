//
//
// HomeDataSource.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Andrea Sánchez Román on 28/09/21.
// Copyright (c) 2021 and Confidential to Melexia All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper
import UIKit


class DataManager {
   
    
    /// Method in charge of obtaining the information of the service
    /// - Parameters:
    ///   - characterId: Character id, this is not mandatory
    ///   - request: RequestModel object
    ///   - completion: contains the information necessary to consume the service
    /// - Returns: object ResponseModel
    func getContent(characterId: Int? = nil,  request: RequestModel, completion: @escaping (ResponseModel?) -> ()) {
         
        var urlStrig = Constants.Endpoints.apiCharacters
        if let id = characterId {
            urlStrig = "\(Constants.Endpoints.apiCharacters)/\(id)"
        }
        
        Singleton.instance.manager!.request(urlStrig, method: .get, parameters: request.toJSON(), encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                if let data = ResponseModel(JSON: value as! [String : Any]) {
                    var response = data
                    response.code = 200
                    completion(response)
                } else {
                    let logResponse = ResponseModel(code: 404, message: Constants.Text.parsingFailed)
                    completion(logResponse)
                }                                
            case .failure( _):
                if response.response?.statusCode == 401 {
                    let logResponse = ResponseModel(code: 401, message: Constants.Text.notAuthorized)
                    completion(logResponse)
                } else {
                    let logResponse = ResponseModel(code: 500, message: Constants.Text.connectionError)
                    completion(logResponse)
                }
            }
        })
    }
}
