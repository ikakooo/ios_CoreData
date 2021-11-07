//
//  Extensions.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 08.11.21.
//

import Foundation

extension Data
{
    func toString() -> String?
    {
        return String(data: self, encoding: .utf8)
    }
}
