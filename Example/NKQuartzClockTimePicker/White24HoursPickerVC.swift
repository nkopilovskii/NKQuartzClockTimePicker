//
//  White24HoursPickerVC.swift
//
//  Created by Nick Kopilovskii on 13.08.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit
import NKQuartzClockTimePicker

class White24HoursPickerVC: UIViewController, NKQuartzClockTimePickerDataSource, NKQuartzClockTimePickerDelegate  {
  
  @IBOutlet weak var picker: NKQuartzClockTimePicker!
  @IBOutlet weak var dot: UIView!
  
  private let buttonTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12",
                              "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "0"]
  
  private var notches: [NKQCNotchConfiguration] {
    var dashes = NKQCNotchConfiguration()
    dashes.style = .dashes(6); dashes.width = 1; dashes.color = .gray; dashes.count = 24
    var spetialDashes = NKQCNotchConfiguration()
    spetialDashes.style = .dashes(10); spetialDashes.width = 3; spetialDashes.color = .black; spetialDashes.count = 8
    
    return [dashes, spetialDashes]
  }
  
  private var buttonNormalConfig: NKQCTimeButtonConfiguration {
    var textConfig = NKQCTextConfiguration()
    textConfig.fontName = "Deutsch-Gothic"; textConfig.size = 16; textConfig.color = .lightGray
    
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.textConfig = textConfig; buttonConfig.sideLength = 60; buttonConfig.backgroundColor = .clear; buttonConfig.cornerRadius = 30; buttonConfig.borderWidth = 0; buttonConfig.borderColor = UIColor.clear.cgColor
    
    return buttonConfig
  }
  
  private var buttonSelectionConfig: NKQCTimeButtonConfiguration {
    var textConfig = NKQCTextConfiguration()
    textConfig.fontName = "Deutsch-Gothic"; textConfig.size = 20; textConfig.color = .black
    
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.textConfig = textConfig; buttonConfig.sideLength = 60; buttonConfig.backgroundColor = .clear; buttonConfig.cornerRadius = 30; buttonConfig.borderWidth = 0; buttonConfig.borderColor = UIColor.clear.cgColor
    
    return buttonConfig
  }
  
  private var hand: NKQCHandConfiguration {
    var hand = NKQCHandConfiguration()
    hand.color = .black; hand.width = 3
    return hand
  }
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.timeComponent = .hour24
    picker.setTime(5)
    picker.timeButtonNormalConfig = buttonNormalConfig
    picker.timeButtonSelectedConfig = buttonSelectionConfig
    picker.notches = notches
    picker.hand = hand
    
    dot.layer.borderColor = UIColor.black.cgColor
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    picker.timeButtonsMargin = 0
    picker.notchMargin = (picker.frame.size.width / 2 - picker.timeButtonNormalConfig.sideLength) / 2
    picker.handMargin = picker.frame.size.width / 5
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, shouldAddTitleFor time: Int) -> Bool {
    return true
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, titleFor time: Int) -> String? {
    return buttonTitles[time - 1]
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, didChange time: Int) {
    
  }
  
}
