//
//  InterfaceController.swift
//  Downloading Web Content WatchKit Extension
//
//  Created by Ronald Fischer on 10/8/15.
//  Copyright (c) 2015 qpiapps. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var theLabel: WKInterfaceLabel!
    @IBOutlet weak var theImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let url = NSURL(string: "http://www.applewatchdevelopercourse.com/message.html")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                println(urlContent)
                self.theLabel.setText(urlContent as? String)
            } else {
                println(error)
            }
            
        })
        
        task.resume()
        
        let url2 = NSURL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/0/02/Homer_Simpson_2006.png/212px-Homer_Simpson_2006.png")
        
        let task2 = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                var homerImage = UIImage(data: data)
                self.theImage.setImage(homerImage!)
            } else {
                println(error)
            }
        })
        
        task2.resume()
        
    }
    


    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
