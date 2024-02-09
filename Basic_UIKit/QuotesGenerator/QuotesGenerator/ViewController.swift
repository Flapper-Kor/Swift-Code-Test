//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 이희웅 on 2022/11/12.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabQuoteGenerate(_ sender: Any) {
        let rnd = Int(arc4random_uniform(5))
        let quote = quotes[rnd]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
        
        print(rnd, quote)
    }
}

