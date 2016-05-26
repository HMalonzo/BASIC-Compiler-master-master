//
//  ViewController.swift
//  BASIC Compiler
//
//  Created by Hanniel C. Malonzo on 5/16/16.
//  Copyright © 2016 Hanniel C. Malonzo. All rights reserved.
//

import UIKit
import Darwin



class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var fileView: UITextView!
    @IBOutlet weak var consoleView: UITextView!
    
    var saveFile = ""
    
    //scrap
   
    
    
    //end of scrap
    
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
        
        if case let args = Process.arguments where args.count > 1, case let file = args[1] {
            if case let fd = fopen(file, "rb") where fd != nil {
                defer { fclose(fd) }
                fseek(fd, 0, SEEK_END)
                let fileSize = ftell(fd)
                fseek(fd, 0, SEEK_SET)
                var buffer = UnsafeMutablePointer<CChar>.alloc(fileSize)
                defer { buffer.destroy() }
                if fread(buffer, sizeof(CChar), fileSize, fd) == fileSize {
                    buffer[fileSize] = 0
                    if let program = String.fromCString(buffer) {
                        if let vm = VM(program: program) {
                            vm.run()
                            exit(EXIT_SUCCESS)
                        }
                        else {
                            print("Invalid BF program in '\(file)'.")
                        }
                    }
                }
            }
            print("Failed to open file '\(file)'.")
            exit(EXIT_FAILURE)
        }
        else {
            print("> ", terminator: "")
            var input = ""
            while let line = readLine() {
                input += line
            }
            if let vm = VM(program: input) {
                vm.run()
            }
            
            else {
                print("Invalid BF program")
                exit(EXIT_FAILURE)
            }
        }
        
        let source = fileView.text
        print(VM(program: source)!.run())
        
    }
    
    
    
    
    
    
    //when the text value changes
    //save text file
    //save date and time of edit
    //execute program
    
    }

    //nodes



