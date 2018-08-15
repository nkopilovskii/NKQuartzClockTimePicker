//
//  Black12ClockPickerVC.swift
//
//  Created by Nick Kopilovskii on 10.08.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit
import NKQuartzClockTimePicker

class Black12HoursPickerVC: UIViewController, NKQuartzClockTimePickerDataSource, NKQuartzClockTimePickerDelegate {
  
  @IBOutlet weak var picker: NKQuartzClockTimePicker!
  
  private let buttonTitles = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII"]
  
  private var notches: [NKQCNotchConfiguration] {
    var externalLine = NKQCNotchConfiguration()
    externalLine.style = .line; externalLine.width = 16; externalLine.color = .white
    var dashes = NKQCNotchConfiguration()
    dashes.style = .dashes(1); dashes.width = 120; dashes.color = .black; dashes.count = 48
    
    return [externalLine, dashes]
  }
  
  private var buttonConfig: NKQCTimeButtonConfiguration {
    var textConfig = NKQCTextConfiguration()
    textConfig.fontName = "Kefa"; textConfig.size = 18; textConfig.color = .white
    
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.textConfig = textConfig; buttonConfig.sideLength = 60; buttonConfig.backgroundColor = .clear; buttonConfig.cornerRadius = 30; buttonConfig.borderWidth = 0; buttonConfig.borderColor = UIColor.clear.cgColor
    
    return buttonConfig
  }
  
  
  private var hand: NKQCHandConfiguration {
    var hand = NKQCHandConfiguration()
    hand.color = .orange; hand.width = 3
    return hand
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.timeComponent = .hour12
    
    picker.timeButtonsMargin = 10
    picker.timeButtonNormalConfig = buttonConfig
    picker.timeButtonSelectedConfig = buttonConfig
    
    picker.hand = hand
    picker.handMargin = 35
    
    picker.notches = notches
    picker.notchMargin = 10
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    picker.setTime(0)
  }
  
  @objc func appendTime() {
    picker.setTime(picker.time + 1)
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
