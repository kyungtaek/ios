//
// Created by kyungtaek on 2017. 2. 24..
// Copyright (c) 2017 sicamp. All rights reserved.
//

import UIKit
import NYTPhotoViewer

class PhotoModel: NSObject, NYTPhoto {

    var image: UIImage?
    var imageData: Data?
    var placeholderImage: UIImage?
    let attributedCaptionTitle: NSAttributedString?
    let attributedCaptionSummary: NSAttributedString?
    let attributedCaptionCredit: NSAttributedString?

    init(image:UIImage?) {
        self.image = image
        self.imageData = nil
        self.attributedCaptionTitle = nil
        self.attributedCaptionSummary =  nil
        self.attributedCaptionCredit =  nil
        super.init()
    }
}
