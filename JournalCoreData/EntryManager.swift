//
//  EntryManager.swift
//  JournalCoreData
//
//  Created by Zachary Buffington on 9/15/21.
//

import Foundation
import CoreData
import UIKit

class EntryManager {
    let context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }()
    static let shared = EntryManager()
    
    var entries: [Entry] = []
    
    // C
    func createEntry(title: String, contents: String) {
        let entry = Entry(title:title, contents: contents)
        entries.append(entry)
        try? context.save()
        
        
    }
    
    // R
    func load() {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        let sortyByTimestamp = NSSortDescriptor(key: "timestamp", ascending: true)
        request.sortDescriptors = [sortyByTimestamp]
        let entries = try? context.fetch(request)
        self.entries = entries ?? []
        
    }
    
    // U
    func update(entry: Entry, title: String, contents: String) {
        entry.title = title
        entry.contents = contents
        try? context.save()
    }
    
    // D
    func delete(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else {return}
        entries.remove(at: index)
        context.delete(entry)
        
    }
    
    
}
