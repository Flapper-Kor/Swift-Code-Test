//
//  ViewController.swift
//  mycarousel
//
//  Created by 이희웅 on 2023/05/26.
//
import iCarousel
import UIKit

class ViewController: UIViewController, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x:self.view.frame.minX, y:self.view.frame.maxY, width : self.view.frame.size.width/2, height:self.view.frame.size.width/2))
        view.backgroundColor = .blue
        return view
    }
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myCarousel)
        myCarousel.dataSource = self

    }
}

