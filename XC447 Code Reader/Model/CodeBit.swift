//
//  CodeBit.swift
//  XC447 Code Reader
//
//  Created by Milosz Brzezinski on 23/11/2022.
//

import Foundation

class CodeBit: ObservableObject, Identifiable{
    let id = UUID()
    @Published var value: Bool
    
    init(value: Bool) {
        self.value = value
    }
}
