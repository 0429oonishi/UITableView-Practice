//
//  Person.swift
//  UITableView-Practice
//
//  Created by 大西玲音 on 2021/08/08.
//

import Foundation
import RealmSwift

final class Person: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var uuid: String = UUID().uuidString
}

final class PersonList: Object {
    let list = List<Person>()
}

struct PersonModel {
    var name: String
}
