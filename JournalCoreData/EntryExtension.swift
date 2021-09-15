//
//  EntryExtension.swift
//  JournalCoreData
//
//  Created by Zachary Buffington on 9/15/21.
//

import Foundation
import UIKit

extension Entry {
    convenience init(title: String, contents: String, timestamp: Date = Date()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.init(context: appDelegate.persistentContainer.viewContext)
        self.title = title
        self.contents = contents
        self.timestamp = timestamp
    }
}
