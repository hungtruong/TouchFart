//
//  WindowController.swift
//  TouchFart
//
//  Created by Hung Truong on 10/27/16.
//  Copyright © 2016 Hung Truong. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController, NSTouchBarDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    func handleFart(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        sound.play()
        
    }
    
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.loud, .short, .fart]

        // Spacing
        // touchBar.defaultItemIdentifiers = [.loud, .flexibleSpace,.short, .flexibleSpace, .fart]

        return touchBar
        
    }
    
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
        case NSTouchBarItemIdentifier.loud:
            let button = NSButton(title: "💩", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
            
        case NSTouchBarItemIdentifier.short:
            let button = NSButton(title: "💨", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItemIdentifier.fart:
            let button = NSButton(title: "fart", target: self, action: #selector(handleFart))
            button.bezelColor = NSColor(red:0.35, green:0.61, blue:0.35, alpha:1.00)
            touchBarItem.view = button
            return touchBarItem
        default:
            let button = NSButton(title: "fart", target: self, action: #selector(handleFart))
            touchBarItem.view = button
            return touchBarItem
            
        }
    }

}
