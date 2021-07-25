//
//  Array+Only.swift
//  MemoGame
//
//  Created by Hyago Henrique on 24/07/21.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1  ? first : nil
    }
}
