//
//  ConfigurableCell.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import Foundation


import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
