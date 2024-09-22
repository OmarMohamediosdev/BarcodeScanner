//
//  AlertItem.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 22/09/2024.
//

import SwiftUI

struct AlertItem :Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let DismissButton: Alert.Button
}

struct AlertContexts {
    static let invalidDeviceInput = AlertItem(title: "Invalid device input",
                                       message: "Something is wrong with the camera",
                                       DismissButton: .default(Text("Ok")))
    
    static let invalidScanType = AlertItem(title: "Invalid scan type",
                                       message: "Barcode is invalid",
                                       DismissButton: .default(Text("Ok")))
}
