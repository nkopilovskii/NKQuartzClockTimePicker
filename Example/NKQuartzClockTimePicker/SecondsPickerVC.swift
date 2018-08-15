//
//  SecondsPickerVC.swift
//
//  Created by Nick Kopilovskii on 13.08.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit
import NKQuartzClockTimePicker

class SecondsPickerVC: UIViewController, NKQuartzClockTimePickerDataSource, NKQuartzClockTimePickerDelegate {
  
  @IBOutlet weak var picker: NKQuartzClockTimePicker!
  
  private var notches: [NKQCNotchConfiguration] {
    var circle = NKQCNotchConfiguration()
    circle.style = .line
    var dashes = NKQCNotchConfiguration()
    dashes.style = .dashes(6); dashes.width = 2; dashes.color = .black; dashes.count = 60
    var spetialsDashes = NKQCNotchConfiguration()
    spetialsDashes.style = .dashes(10); spetialsDashes.width = 4; spetialsDashes.color = .purple; spetialsDashes.count = 12
    
    return [dashes, spetialsDashes, circle]
  }
  
  private var buttonNormalConfig: NKQCTimeButtonConfiguration {
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.sideLength = 60; buttonConfig.backgroundColor = .clear; buttonConfig.cornerRadius = 30
    return buttonConfig
  }
  
  private var buttonSelectionConfig: NKQCTimeButtonConfiguration {
    var textConfig = NKQCTextConfiguration()
    textConfig.fontName = "SystemBold"; textConfig.color = .white; textConfig.size = 20
    
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.sideLength = 40; buttonConfig.backgroundColor = UIColor(displayP3Red: 79.0/255, green: 0, blue: 150.0/255, alpha: 1); buttonConfig.cornerRadius = 20; buttonConfig.borderWidth = 2; buttonConfig.borderColor = UIColor.orange.cgColor
    return buttonConfig
  }
  
  private var hand: NKQCHandConfiguration {
    var hand = NKQCHandConfiguration()
    hand.color = .red; hand.width = 3
    return hand
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.layer.borderColor = UIColor(displayP3Red: 148.0/255, green: 23.0/255, blue: 81.0/255, alpha: 1).cgColor
    picker.timeComponent = .second
    picker.setTime(5)
    picker.timeButtonNormalConfig = buttonNormalConfig
    picker.timeButtonSelectedConfig = buttonSelectionConfig
    picker.notches = notches
    picker.hand = hand
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    picker.timeButtonsMargin = 0
    picker.notchMargin = (picker.frame.size.width / 2 - picker.timeButtonNormalConfig.sideLength) / 2
    picker.handMargin = picker.frame.size.width / 5
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, shouldAddTitleFor time: Int) -> Bool {
    return time % 5 == 0
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, titleFor time: Int) -> String? {
    return nil
  }
  
  func clockPicker(_ picker: NKQuartzClockTimePicker, didChange time: Int) {
    
  }
  
}
