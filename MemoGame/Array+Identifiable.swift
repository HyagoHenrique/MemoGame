//
//  Array+Identifiable.swift
//  MemoGame
//
//  Created by Hyago Henrique on 24/07/21.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        
        return nil
    }
}
