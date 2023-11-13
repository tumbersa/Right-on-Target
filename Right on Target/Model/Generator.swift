//
//  Generator.swift
//  Right on Target
//
//  Created by Глеб Капустин on 11.11.2023.
//

import UIKit

final class Generator: GeneratorProtocol {
    func getRandomValue(minValue: Int, maxValue: Int) -> Int {
        return (minValue...maxValue).randomElement()!
    }
    
    func getRandomHexColor()->String{
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        
        randomColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        
        let redHex = String(format: "%02X", Int(redValue * 255))
        let greenHex = String(format: "%02X", Int(greenValue * 255))
        let blueHex = String(format: "%02X", Int(blueValue * 255))
        
        return "#" + redHex + greenHex + blueHex
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        sanitizedHex = sanitizedHex.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: sanitizedHex).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

