//
//  LoginViewModel.swift
//  onlinechat
//
//  Created by erdem öden on 10.02.2022.
//

import Foundation

class LoginViewModel{
    
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
        let Session = URLSession.shared.dataTask(with: URL) { (Data, Response, Error) in
            if(Error != nil){
                print("olmadı")
                // viewcontroller alert
            }
            else{
                if(Data != nil){
                    do{
                        let JsonRes = try JSONSerialization.jsonObject(with: Data!, options: []);
                        print(JsonRes);
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
