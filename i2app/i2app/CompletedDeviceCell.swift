//
//  CompletedDeviceCell.swift
//  i2app
//
//  Arcus Team on 3/29/18.
/*
 * Copyright 2019 Arcus Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
//

import Foundation
import Cornea

public class CompletedDeviceCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var deviceIcon: UIImageView!
  
  func bindToModel(_ model: CompletedDeviceSectionModel) {
    titleLabel.text = model.deviceName
    subtitleLabel.text = model.vendorName
    deviceIcon.applySmallDeviceIcon(productId: model.productId, devTypeHint: model.devTypeHint)
  }
}

extension UIImageView: CachedImageLoader {
  func applySmallDeviceIcon(productId: String, devTypeHint: String) {
    downloadImage(productId,
                  devTypeId:  devTypeHint,
                  placeHolder: "",
                  isLarge: false,
                  isBlack: true,
                  completionHandler: {
                    (image) in
                      self.image = image
                  })
  }
}
