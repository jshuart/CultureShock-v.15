//
//  Node.swift
//  CultureShock
//
//  Created by Joe Shuart on 7/30/15.
//  Copyright (c) 2015 Joe Shuart. All rights reserved.
//

import Foundation


class Node {

    var field_class_day_value: String
    var class_time_final :String
    var field_class_flex_header_value: String
    var title_final: String
    var field_ages_value: String?
    var field_class_footer_value: String?
    var field_class_flex_footer_value: String
    var field_class_instructor_nid: String?
    
    
    
    init(field_class_day_value:String,
        class_time_final: String,
        field_class_flex_header_value: String,
        title_final: String,
        field_ages_value: String?,
        field_class_footer_value: String?,
        field_class_flex_footer_value: String,
        field_class_instructor_nid: String?){
        
        self.field_class_day_value = field_class_day_value
        self.class_time_final = class_time_final
        self.field_class_flex_header_value = field_class_flex_header_value
        self.title_final = title_final
        self.field_ages_value = field_ages_value
        self.field_class_footer_value = field_class_footer_value
        self.field_class_flex_footer_value = field_class_flex_footer_value
        self.field_class_instructor_nid = field_class_instructor_nid
    
    }
    
    
}