//
//  View.swift
//  P3Colors
//
//  Created by Riccardo Cipolleschi on 10/01/2024.
//

import UIKit

class View: UIView {
  
  let controlLabel: UILabel
  let redLabel: UILabel
  let redSlider: UISlider
  let greenLabel: UILabel
  let greenSlider: UISlider
  let blueLabel: UILabel
  let blueSlider: UISlider
  let sRGBView: UIView
  let p3View: UIView
  let sRGBFromP3View: UIView
  let p3FromP3View: UIView
  
  override init(frame: CGRect = .zero) {
    self.controlLabel = .init()
    self.redLabel = .init()
    self.redSlider = .init()
    self.greenLabel = .init()
    self.greenSlider = .init()
    self.blueLabel = .init()
    self.blueSlider = .init()
    self.sRGBView = .init()
    self.p3View = .init()
    self.sRGBFromP3View = .init()
    self.p3FromP3View = .init()
    
    super.init(frame: frame)
    
    self.setup()
  }
  
  func setup() {
    super.backgroundColor = .systemBackground
    
    self.addSubview(controlLabel)
    self.addSubview(redLabel)
    self.addSubview(redSlider)
    self.addSubview(greenLabel)
    self.addSubview(greenSlider)
    self.addSubview(blueLabel)
    self.addSubview(blueSlider)
    self.addSubview(sRGBView)
    self.addSubview(p3View)
    self.addSubview(sRGBFromP3View)
    self.addSubview(p3FromP3View)
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    redSlider.addAction(UIAction { _ in
      self.updateViewBG()
    }, for: .valueChanged)
    
    greenSlider.addAction(UIAction { [unowned self] _ in
      self.updateViewBG()
    }, for: .valueChanged)
    
    blueSlider.addAction(UIAction { [unowned self] _ in
      self.updateViewBG()
    }, for: .valueChanged)
    
    self.style()
  }
  
  func updateViewBG() {
    self.sRGBView.backgroundColor = UIColor(
      red: CGFloat(self.redSlider.value),
      green: CGFloat(self.greenSlider.value),
      blue: CGFloat(self.blueSlider.value),
      alpha: 1.0)
    
    let p3Color: UIColor = .init(
      displayP3Red: CGFloat(self.redSlider.value),
      green: CGFloat(self.greenSlider.value),
      blue: CGFloat(self.blueSlider.value),
      alpha: 1.0)
    
    self.p3View.backgroundColor = p3Color
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    p3Color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    sRGBFromP3View.backgroundColor = UIColor(
      red: red,
      green: green,
      blue: blue,
      alpha: alpha
    )
    
    p3FromP3View.backgroundColor = UIColor(
      displayP3Red: red,
      green: green,
      blue: blue,
      alpha: alpha
    )
    
  }
  
  func style() {
    self.styleLabel(controlLabel, text: "Controls", isTitle: true)
    self.styleLabel(redLabel, text: "Red")
    self.styleLabel(blueLabel, text: "Blue")
    self.styleLabel(greenLabel, text: "Green")
    
    self.styleSlider(redSlider)
    self.styleSlider(greenSlider)
    self.styleSlider(blueSlider)
    
    self.styleView(sRGBView)
    self.styleView(p3View)
    self.styleView(sRGBFromP3View)
    self.styleView(p3FromP3View)
    updateViewBG()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let vMargin: CGFloat = 10
    let hMargin: CGFloat = 20
    let side: CGFloat = 150
    
    NSLayoutConstraint.activate([
      controlLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      controlLabel.topAnchor.constraint(equalTo: topAnchor, constant: safeAreaInsets.top)
    ])
    
    NSLayoutConstraint.activate([
      redLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      redLabel.topAnchor.constraint(equalTo: controlLabel.bottomAnchor, constant: vMargin)
    ])
    
    NSLayoutConstraint.activate([
      redSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hMargin),
      redSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -hMargin),
      redSlider.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: vMargin/4)
    ])
    
    NSLayoutConstraint.activate([
      greenLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      greenLabel.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: vMargin)
    ])
    
    NSLayoutConstraint.activate([
      greenSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hMargin),
      greenSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -hMargin),
      greenSlider.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: vMargin/4)
    ])
    
    NSLayoutConstraint.activate([
      blueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      blueLabel.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: vMargin)
    ])
    
    NSLayoutConstraint.activate([
      blueSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hMargin),
      blueSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -hMargin),
      blueSlider.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: vMargin/4)
    ])
    
    NSLayoutConstraint.activate([
      sRGBView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hMargin),
      sRGBView.widthAnchor.constraint(equalToConstant: side),
      sRGBView.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: vMargin),
      sRGBView.heightAnchor.constraint(equalToConstant: side),
    ])
    
    NSLayoutConstraint.activate([
      p3View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -hMargin),
      p3View.widthAnchor.constraint(equalToConstant: side),
      p3View.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: vMargin),
      p3View.heightAnchor.constraint(equalToConstant: side),
    ])
    
    NSLayoutConstraint.activate([
      sRGBFromP3View.leadingAnchor.constraint(equalTo: leadingAnchor, constant: hMargin),
      sRGBFromP3View.widthAnchor.constraint(equalToConstant: side),
      sRGBFromP3View.topAnchor.constraint(equalTo: sRGBView.bottomAnchor, constant: vMargin),
      sRGBFromP3View.heightAnchor.constraint(equalToConstant: side),
    ])

    NSLayoutConstraint.activate([
      p3FromP3View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -hMargin),
      p3FromP3View.widthAnchor.constraint(equalToConstant: side),
      p3FromP3View.topAnchor.constraint(equalTo: sRGBView.bottomAnchor, constant: vMargin),
      p3FromP3View.heightAnchor.constraint(equalToConstant: side),
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


fileprivate extension View {
  func styleLabel(_ label: UILabel, text: String, isTitle: Bool = false) {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .label
    label.font = .systemFont(ofSize: isTitle ? UIFont.systemFontSize : UIFont.smallSystemFontSize)
  }
  
  func styleSlider(_ slider: UISlider) {
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.minimumValue = 0
    slider.maximumValue = 1
    slider.isContinuous = true
  }
  
  func styleView(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.borderColor = UIColor.label.cgColor
    view.layer.borderWidth = 1
  }
}
