//
//  ScheduleTableViewController.swift
//  CultureShock
//
//  Created by Joe Shuart on 7/30/15.
//  Copyright (c) 2015 Joe Shuart. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var myTableView: UITableView!
    
    var nodeCollection = [Node]()
    
    var service:NodeService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = NodeService()
        service.getNodes {
        (response) in
            self.loadNodes(response["nodes"] as! NSArray)
        }
    }
    
  
    
    func loadNodes(nodes:NSArray){
    
    for node in nodes {
    
    var node = node["node"]! as! NSDictionary
    
    var field_class_day_value = node["field_class_day_value"] as! String
    
    var field_class_time_start_value = node["field_class_time_start_value"] as! String
    
    var field_class_time_end_value = node["field_class_time_end_value"] as! String
    
    var field_class_flex_header_value = node["field_class_flex_header_value"] as! String
    
    var title = node["title"] as!String
    
    var field_ages_value = node["field_ages_value"] as? String
    
    var field_class_footer_value = node["field_class_footer_value"] as? String
    
    var field_class_flex_footer_value = node["field_class_flex_footer_value"] as! String
    
    var field_class_instructor_nid = node["field_class_instructor_nid"] as? String
    
    
    
        switch field_class_day_value {
        case "1":
            field_class_day_value = "Monday"
        case "2":
            field_class_day_value = "Tuesday"
        case "3":
            field_class_day_value = "Wednesday"
        case "4":
            field_class_day_value = "Thrusday"
        case "5":
            field_class_day_value = "Friday"
        case "6":
            field_class_day_value = "Saturday"
        default:
            field_class_day_value = "Sunday"
        }
        
        
        //convert time
        var dataStringStartTime = field_class_time_start_value
        var dataStringEndTime = field_class_time_end_value
        
        var dateFormatter = NSDateFormatter()
        var dateFormatter2 = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter2.dateFormat = "h:mm a"
        
        
        
        let dateValueStartTime = dateFormatter.dateFromString(dataStringStartTime) as NSDate!
        let dateValueEndTime = dateFormatter.dateFromString(dataStringEndTime) as NSDate!
        
        let class_time_start_value = dateFormatter2.stringFromDate(dateValueStartTime)
        let class_time_end_value = dateFormatter2.stringFromDate(dateValueEndTime)
        
        let class_time_final = "\(class_time_start_value) - \(class_time_end_value)"
        
        let title_final = title.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

    
    var nodeObj = Node(field_class_day_value: field_class_day_value,
        
    class_time_final: class_time_final,
    
    field_class_flex_header_value: field_class_flex_header_value,
    
    title_final: title_final,
    
    field_ages_value: field_ages_value,
    
    field_class_footer_value: field_class_footer_value,
    
    field_class_flex_footer_value: field_class_flex_footer_value,
    
    field_class_instructor_nid: field_class_instructor_nid)
    
    nodeCollection.append(nodeObj)
    
    dispatch_async(dispatch_get_main_queue()) {
    
    self.tableView.reloadData()
    
                }
    
            }
    
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Return the number of rows in the section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return nodeCollection.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell

        let node = nodeCollection[indexPath.row]
        cell.lbl_day_value.text = node.field_class_day_value
        cell.lbl_class_time_final.text = node.class_time_final
        cell.lbl_flex_header_value.text = node.field_class_flex_header_value
        cell.lbl_title.text = node.title_final
        if (node.field_ages_value != nil){
            cell.lbl_ages_value.text = node.field_ages_value}
        else{
            cell.lbl_ages_value.hidden = true
        }
        cell.lbl_footer_value.text = node.field_class_footer_value
        cell.lbl_flex_footer_value.text = node.field_class_flex_footer_value
        cell.lbl_instructor_nid.text = node.field_class_instructor_nid
        
        /*for view in cell.subviews {
            if let label = view as? UILabel {
                if label.text!.isEmpty {
                    label.hidden = true
                }
                else {
                    label.hidden = false
                }
            }
        }*/

    
        return cell
    }
    
    

}
