//
// Created by kyungtaek on 2017. 2. 23..
// Copyright (c) 2017 sicamp. All rights reserved.
//

import UIKit
import SDWebImage

protocol ReadOnlyProfileHeaderDelegate: NSObjectProtocol {
    func skipHeader()
}

class ReadOnlyDeceasedProfileHeaderView: UIView {
    
    weak var delegate: ReadOnlyProfileHeaderDelegate!
    
    var imageView1 = UIImageView()
    var label1 = UILabel()
    var label2 = UILabel()
    
    var view2 = UIView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    
    var button1 = UIButton()
    
    var user:User? {
        didSet {
            guard let currentUser = user else {
                return
            }
            
            label1.attributedText = String("\(currentUser.userName)님이 당신을 위해\n미리 준비해 둔 메시지입니다.").attrString(font: UIFont.drNM20Font(), color: UIColor.white, lineSpacing: 7, alignment: .center)
            label2.text = "언제든 들어오셔서 \(currentUser.userName)님을 추억해주세요."
            
            if let profileUrl = currentUser.profileImageUrl as? String {
                self.imageView2.sd_setImage(with: URL(string:profileUrl))
            }
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        uni(frame: [0, 0, 375, 670], pad: [])
        backgroundColor = UIColor(hexString: "ebeef1")
        
        let backView = UIView()
        backView.uni(frame: [0, -500, 375, 500], pad: [])
        backView.backgroundColor = UIColor(hexString: "6c7281")
        addSubview(backView)
        
        imageView1.uni(frame: [0, 0, 375, 331], pad: [])
        imageView1.image = #imageLiteral(resourceName: "nightBg")
        addSubview(imageView1)
        
        label1.uni(frame: [55, 123, 265, 80], pad: [])
        label1.font = UIFont.drNM20Font()
        label1.textAlignment = .center
        label1.textColor = UIColor.white
        label1.numberOfLines = 0
        label1.text = "수지님이 당신을 위해\n미리 준비해 둔 메시지입니다."
        addSubview(label1)
        
        label2.uni(frame: [0, 203, 375, 25], pad: [])
        label2.font = UIFont.drSDLight14Font()
        label2.textAlignment = .center
        label2.textColor = UIColor.white
        label2.text = "언제든 들어오셔서 수지님을 추억해주세요."
        addSubview(label2)
        
        view2.uni(frame: [0, 331, 375, 311], pad: [])
        view2.backgroundColor = UIColor.white
        addSubview(view2)
        
        imageView2.uni(frame: [130, 83, 115, 115], pad: [])
        imageView2.backgroundColor = UIColor.black
        imageView2.layer.cornerRadius = imageView2.bounds.width / 2
        imageView2.layer.masksToBounds = true
        view2.addSubview(imageView2)
        
        imageView3.uni(frame: [159, 207, 57.5, 23], pad: [])
        imageView3.contentMode = .scaleAspectFit
        imageView3.image = #imageLiteral(resourceName: "logoDark")
        view2.addSubview(imageView3)
        
        button1.uni(frame: [172.5, 627, 30, 30], pad: [])
        button1.setImage(#imageLiteral(resourceName: "arrowDown"), for: .normal)
        button1.addTarget(self, action: #selector(action(button:)), for: .touchUpInside)
        addSubview(button1)
    }
    
    @objc private func action(button: UIButton) {
        delegate.skipHeader()
    }
    
}
