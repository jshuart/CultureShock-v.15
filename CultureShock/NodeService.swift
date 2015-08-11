//
//  NodeService.swift
//  CultureShock
//
//  Created by Joe Shuart on 7/30/15.
//  Copyright (c) 2015 Joe Shuart. All rights reserved.
//

import Foundation


class NodeService {
    var settings:Settings!
    
    init(){
    
    self.settings = Settings()
    }
    
    func getNodes(callback:(NSDictionary) ->()){
    request(settings.getAddress, callback: callback)
    
    }
    
    func request(url: String, callback:(NSDictionary) -> ()){
        var nsURL = NSURL(string: url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL!){
        (data, response, error) in
            var error:NSError?
            var response =  NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
            callback(response)
            }
        task.resume()
        }
}

