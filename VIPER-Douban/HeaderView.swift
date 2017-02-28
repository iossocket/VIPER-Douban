//
//  HeaderView.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/27/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    private var pageControl: UIPageControl?
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        pageControl = UIPageControl()
        pageControl?.numberOfPages = 5
        pageControl?.currentPage = 1
        pageControl?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageControl!)
        pageControl?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pageControl?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pageControl?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        pageControl?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func config(images: Array<String>) {
        scrollView.isPagingEnabled = true
        let imageViews = images.map { name -> UIImageView in
            let view = UIImageView(image: UIImage(named: name))
            view.contentMode = UIViewContentMode.scaleAspectFill
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            return view
        }
        let count = imageViews.count
        for (index, imageView) in imageViews.enumerated() {
            scrollView.addSubview(imageView)
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: self.bounds.width * CGFloat(index)).isActive = true
            if index == count - 1 {
               imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            }
        }
    }
}
