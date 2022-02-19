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
    func SetNameImage(){
        
    }
}
