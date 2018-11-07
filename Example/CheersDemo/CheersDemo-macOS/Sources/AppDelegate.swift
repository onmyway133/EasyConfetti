//
//  AppDelegate.swift
//  CheersDemo-macOS
//
//  Created by Boy van Amstel on 07/11/2018.
//  Copyright © 2018 Hyper Interaktiv AS. All rights reserved.
//

import Cocoa
import Cheers

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var cheerView: CheerView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func buttonTapped(_ sender: NSButton) {
        cheerView.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.cheerView.stop()
        }
    }
    
}

