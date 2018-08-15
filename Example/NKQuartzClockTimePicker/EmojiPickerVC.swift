//
//  EmojiPickerVC.swift
//
//  Created by Nick Kopilovskii on 13.08.2018.
//  Copyright © 2018 Nick Kopilovskii. All rights reserved.
//

import UIKit
import NKQuartzClockTimePicker

class EmojiPickerVC: UIViewController, NKQuartzClockTimePickerDataSource, NKQuartzClockTimePickerDelegate {
  
  @IBOutlet weak var picker: NKQuartzClockTimePicker!
  
  private let buttonTitles = ["😊", "😃", "😆", "😂", "🤣", "😅", "🤗", "😎", "🤩", "😍", "😜", "😡"]
  
  private var buttonConfig: NKQCTimeButtonConfiguration {
    var textConfig = NKQCTextConfiguration()
    textConfig.size = 30
    
    var buttonConfig = NKQCTimeButtonConfiguration()
    buttonConfig.textConfig = textConfig; buttonConfig.sideLength = 40; buttonConfig.backgroundColor = .clear;
    
    return buttonConfig
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.timeComponent = .hour12
    picker.setTime(3)
    
    picker.hand.color = .blue
    picker.hand.width = 3
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    picker.timeButtonsMargin = 0
    picker.timeButtonNormalConfig = buttonConfig
    picker.timeButtonSelectedConfig = buttonConfig
    
    picker.notchMargin = picker.timeButtonNormalConfig.sideLength + 16
    
    var dots = NKQCNotchConfiguration()
    dots.style = .dots; dots.width = 8; dots.color = .purple; dots.count = 12
    var spetialDots = NKQCNotchConfiguration()
    spetialDots.style = .dots; spetialDots.width = 16; spetialDots.color = .brown; spetialDots.count = 4
    picker.notches = [dots, spetialDots]
    
    picker.handMargin = picker.notchMargin
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
