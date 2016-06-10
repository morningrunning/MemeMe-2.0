//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Ronald Morgan on 6/7/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //make Tabbar visible in case it got hidden
        tabBarController?.tabBar.hidden = false
        
        //add + sign for new Memes
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(SentMemeTableViewController.addNewMeme))
        navigationItem.title = "Sent Memes Table View"
        navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        
        //Reload Table Data to reflect all Memes
        tableView.reloadData()
    }
    
    func addNewMeme(){
        let newMemeController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        //present MemeMe Edit ViewController modally
        presentViewController(newMemeController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell")!
        cell.imageView?.image = memes[indexPath.row].memeImage
        cell.textLabel?.text = memes[indexPath.row].topText + " ... " + memes[indexPath.row].bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailViewController = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        memeDetailViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
    //MARK: Implemented Delete Row functionality
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("Delete pressed")
            
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
        
    }
    
}
