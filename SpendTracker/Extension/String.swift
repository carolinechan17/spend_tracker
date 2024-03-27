//
//  String.swift
//  MoneyMinder
//
//  Created by Caroline Chan on 27/03/24.
//

import Foundation

extension String {
    public subscript(_ idx: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: idx)]
    }
}
