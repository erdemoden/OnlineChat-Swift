//
//  HamburgerVM.swift
//  onlinechat
//
//  Created by erdem öden on 19.02.2022.
//

import Foundation
import CoreData
import UIKit
class HamburgerVM{
    let AppDelegate:AppDelegate!
    let Context:NSManagedObjectContext!
    init() {
        self.AppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.Context = AppDelegate.persistentContainer.viewContext
    }
    // MARK: Setting User Name And Image
    func SetNameImage() -> [String:Any?]{
        var name:Any? = nil;
        var image:Any? = nil;
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Session");
        fetch.returnsObjectsAsFaults = false;
        do{
        let results = try self.Context.fetch(fetch);
        for result in results as! [NSManagedObject]{
             name = result.value(forKey: "name");
             image = result.value(forKey: "image");
            }
        }
        catch{
            print("error");
        }
        if(image == nil){
            return ["image":nil,"username":name as! String];
        }
        else{
            return ["image":image as! Data,"username":name as! String];
        }
    }
}
