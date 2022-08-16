//
//  coreDataFns.swift
//  ClothesStore
//
//  Created by macbook pro on 13/08/2022.
//

import Foundation
import UIKit
import CoreData


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
                break
            }
        }
    } catch  {  }
    return id
}

func getById(id:Int) -> User
{
    let usr = NSEntityDescription.entity(forEntityName: "User",
            in: context)!
    var uninsertedItem = User(entity: usr, insertInto:nil)
        do
        {
            users = try  context.fetch(User.fetchRequest())
            print("usersCount in getbyid \(users.count)")
            for user in users
            {
                if id == user.identifier
                {
                    print("Email= \(user.email!)..Password=\(user.password!),...userId = \(user.identifier)")

                    uninsertedItem = user
                    break

                }
            
            }
        }    catch  {  }
    return uninsertedItem
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
        newUser.identifier = Int64(users.count)

        
    }catch
    {
    }
    do
    {
            try context.save()
        let userss = try  context.fetch(User.fetchRequest())
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
