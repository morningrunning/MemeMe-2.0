//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Ronald Morgan on 6/7/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import UIKit

class MemeDetailViewController : UIViewController {

    var meme : Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //hide Tabbar
        tabBarController?.tabBar.hidden = true
        
        //add "Edit" button for to Edit a stored Memes
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: #selector(MemeDetailViewController.editMeme))
        navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        imageView.contentMode = .ScaleAspectFit
        imageView.image = meme.memeImage
    }
    
    func editMeme(){
        let editMemeController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        editMemeController.originalImage = meme.originalImage
        
        //present MemeMe Edit ViewController modally
        presentViewController(editMemeController, animated: true, completion: nil)
    }
    
}
