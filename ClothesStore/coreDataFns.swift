//
//  coreDataFns.swift
//  ClothesStore
//
//  Created by macbook pro on 13/08/2022.
//

import Foundation
import UIKit

var users: [User] = []
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


func userExists(email:String, password: String) -> Int
{
    var id:Int = -1

        do{
        users = try  context.fetch(User.fetchRequest())
        print("users count = \(users.count)")
        for user in users{
            print("Email= \(user.email!) .. Password= \(user.password!)")
            if email == user.email && password == user.password
            {
                id = Int(user.identifier)
                print("Succeededdd")
            }
        }
    } catch  {  }
    return id
}

func getById(id:Int) -> User
{
    var usr = User(context: context)

        do
        {
        users = try  context.fetch(User.fetchRequest())
        print("users count = \(users.count)")
        for user in users{
            print("Email= \(user.email!) .. Password= \(user.password!)")
            if id == user.identifier
            {
                usr = user
                break
            }
            
        }
    } catch  {  }
    return usr
}
var id:Int64 = 0

func InsertUser(email:String,password:String, name:String)
{
    let newUser = User(context: context)
    newUser.identifier = Int64(userId)
    newUser.name = name
    newUser.email = email
    newUser.password = password
    do{
        let users = try context.fetch(User.fetchRequest())
        for user in users{
            id = user.identifier
        }
        
    }catch
    {
    }
    newUser.identifier = id+1
    do
    {
            try context.save()
        let userss = try  context.fetch(User.fetchRequest())
        print("users count = \(userss.count)")
        for user in userss
        {
            print("\(user.identifier)")
        }
    } catch { }
}

func deleteUsers()
{
        do
        {
            let users = try  context.fetch(User.fetchRequest()) as [User]
        for user in users{
            context.delete(user)
            do
            {
            try context.save()
                
            }
            catch {  }

        }
            print("users count = \(users.count)")

            
    }
    catch  {  }
    
}
