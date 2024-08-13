//
//  String+Extension.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/13/24.
//

import Foundation

extension String {
    func displayFormat() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = inputFormatter.date(from: self) else {
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM, yyyy h:mma"
        
        return outputFormatter.string(from: date)
    }
}
