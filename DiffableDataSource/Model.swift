//
//  Model.swift
//  DiffableDataSource
//
//  Created by Inpyo Hong on 2021/03/31.
//

import Foundation

enum Section: CaseIterable {
    case main
}

struct EmpModel: Hashable {
    var id: String
    var name: String
    
    init(id: String,name: String) {
        self.id = id
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
