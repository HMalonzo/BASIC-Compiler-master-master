//
//  ViewController.swift
//  BASIC Compiler
//
//  Created by Hanniel C. Malonzo on 5/16/16.
//  Copyright © 2016 Hanniel C. Malonzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var fileView: UITextView!
    @IBOutlet weak var consoleView: UITextView!
    
    var saveFile = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        
        
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        saveFile = fileView.text
        print(saveFile)
        return true
    }
    
    
    
    @IBAction internal func Execute(sender: UIButton) {
        
        

        
        //scraps (redo later)
        
        
        
        //parser
        
    }
    
    
    
    
    
    
    //when the text value changes
    //save text file
    //save date and time of edit
    //execute program
    
    }

    //nodes



