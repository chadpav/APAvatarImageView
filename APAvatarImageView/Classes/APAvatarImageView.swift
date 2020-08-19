//
//  APAvatarImageView.swift
//  Pods
//
//  Created by Chad Pavliska on 10/25/16.
//
//

import UIKit

public class APAvatarImageView: UIImageView {

    private var label: UILabel?

    public var fullName: String? = nil

    /** Font used to display user initials */
    public var font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)

    /** The avatar image to display */
    override public var image: UIImage? {
        didSet {
            self.subviews.forEach { (subView) in
                subView.removeFromSuperview()
            }


            // Center in Superview, make same size as superview
            //            let centerImageX = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
            //            let centerImageY = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
            //            let width = NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0)
            //            let height = NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0)
            //            self.addConstraints([centerImageX, centerImageY, width, height])

        }
    }

    public var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    public var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

//    override public init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        // Make circle
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true

        if let _ = self.image {
            return
        }

        // Add Initials Label
        if self.label == nil {
            label = UILabel()

            label!.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
            label!.text = getInitials()
            label!.font = self.font
            label!.textColor = self.tintColor
            label!.textAlignment = .center
            label!.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label!)

            // Center in Superview
            let centerX = NSLayoutConstraint(item: label!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
            let centerY = NSLayoutConstraint(item: label!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 1)
            self.addConstraints([centerX, centerY])

        }

    }

    fileprivate func getInitials() -> String {
        guard let fullName = self.fullName else { return "" }

        var initials = ""
        let components = fullName.components(separatedBy: " ")

        if let first = components[0].characters.first {
            initials = "\(first)".uppercased()
        }

        if components.count == 1 {
            if let initial = components[0].characters.dropFirst().first {
                initials += "\(initial)"
            }
        } else {
            if let initial = components[1].characters.first {
                initials += "\(initial)".uppercased()
            }
        }
        
        return initials.capitalized
    }
    
    
}
