//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Ronald Morgan on 6/7/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController{
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
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(SentMemeCollectionViewController.addNewMeme))
        navigationItem.title = "Sent Memes Collection View"
        navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        
        //Reload Table Data to reflect all Memes
        collectionView?.reloadData()
    }
    
    func addNewMeme(){
        let newMemeController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        //present MemeMe Edit ViewController modally
        presentViewController(newMemeController, animated: true, completion: nil)
    }
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SentMemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        cell.imageView?.image = memes[indexPath.row].memeImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let memeDetailViewController = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        memeDetailViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }

}
