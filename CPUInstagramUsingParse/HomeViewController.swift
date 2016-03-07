//
//  HomeViewController.swift
//  CPUInstagramUsingParse
//
//  Created by Juan Hernandez on 3/5/16.
//  Copyright © 2016 ccsf. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var photos: [PFObject]!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //construct PFQuery
//        let query = PFQuery(className: "Post")
//        query.orderByDescending("createdAt")
//        query.includeKey("author")
//        query.limit = 20
//        
//        // fetch data asynchronously
//        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
//            if let posts = posts {
//                // do something with the data fetched
//                print("data fetched")
//                self.photos = posts
//                self.tableView.reloadData()
//            } else {
//                // handle error
//                print ("Error")
//            }
//        }

        parseAPICall()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        parseAPICall()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return photos?.count ?? 0
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //created a cell that represent the TableView Cell which contains Caption and Image
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeTableViewCell", forIndexPath: indexPath) as! HomeTableViewCell
        
        //I am getting back an array from the Parse
        //So here I just go to one element of that array
        let photo = photos[indexPath.row]
        
        
        
        //Out of that array I extract "image" and "caption"
        //1- setting the image
        
//        var instagramPost: PFObject! {
//            didSet {
//                print("did set the image")
//                cell.photoFromParse.file = photo["media"] as? PFFile
//                cell.photoFromParse.loadInBackground()
//            }
//        }
        
        cell.photoFromParse.file = photo["media"] as? PFFile
        cell.photoFromParse.loadInBackground()
        
        
        //2-setting the caption
        let caption = photo ["caption"] as! String
        cell.captionUILabel.text = caption
        
        
        
        return cell
        
    }

    func parseAPICall() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                print("data fetched")
                self.photos = posts
                self.tableView.reloadData()
            } else {
                // handle error
                print ("Error")
            }
        }
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
