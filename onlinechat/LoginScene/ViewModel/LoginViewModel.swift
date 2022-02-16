//
//  LoginViewModel.swift
//  onlinechat
//
//  Created by erdem öden on 10.02.2022.
//

import Foundation
import CoreData
import UIKit
protocol ShowLogAlert{
    func AlertCall(AlertMessage:String);
}
class LoginViewModel{
    var Delegate :ShowLogAlert!;
    var Session = [SessionMod]();
    let AppDelegate:AppDelegate!
    let Context:NSManagedObjectContext!
    init(){
        self.AppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.Context = AppDelegate.persistentContainer.viewContext
    }
    func PostLogin(UserName:String,Password:String){
        let URL = URL(string: "localhost:1998/login")!;
        var Request = URLRequest(url: URL);
        let Params = [
            "username":UserName,
            "password":Password
        ];
        Request.httpMethod = "POST";
        Request.setValue("Application/json", forHTTPHeaderField: "Content-Type");
        Request.httpBody = try? JSONSerialization.data(withJSONObject: Params, options: [])
        let Session = URLSession.shared.dataTask(with: Request) { (Data, Response, Error) in
            if(Error != nil){
                print("olmadı")
                // viewcontroller alert
            }
            else{
                if(Data != nil){
                    do{
                        let entity = NSEntityDescription.insertNewObject(forEntityName: "Session", into: self.Context);
                        self.Session = try JSONDecoder().decode([SessionMod].self, from: Data!);
                        if(self.Session[0].sessionid != "null"){
                        entity.setValue(self.Session[0].sessionid, forKey: "session");
                            try self.Context.save()
                        }
                        else{
                            self.Delegate.AlertCall(AlertMessage: self.Session[0].error);
                        }
                    }
                    catch{
                        print("error")
                    }
                }
                
            }
        }
        Session.resume();
    }
}
