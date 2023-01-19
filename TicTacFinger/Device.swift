//
//  Device.swift
//  TicTacFinger
//
//  Created by Consultant on 1/11/23.
//


import UIKit

struct Device {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
