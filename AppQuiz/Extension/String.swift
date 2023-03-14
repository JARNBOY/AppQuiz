//
//  String.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import Foundation
import UIKit
extension String {
    
    func toImage() -> UIImage? {
        return UIImage(named: self)
    }
}
