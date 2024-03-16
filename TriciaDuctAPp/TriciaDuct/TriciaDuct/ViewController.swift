//
//  ViewController.swift
//  TriciaDuct
//
//  Created by Manish Bhanushali on 06/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    
    
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet weak var btn3: UIButton!
    
    
    
    @IBOutlet weak var btn4: UIButton!
    
    
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var view3: UIView!
    
    
    @IBOutlet weak var view4: UIView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btn1.layer.cornerRadius = btn1.frame.height / 2
               btn2.layer.cornerRadius = btn2.frame.height / 2
               btn3.layer.cornerRadius = btn3.frame.height / 2
               btn4.layer.cornerRadius = btn4.frame.height / 2
        
        
        view1.layer.cornerRadius = view1.frame.height / 2
                view2.layer.cornerRadius = view2.frame.height / 2
                view3.layer.cornerRadius = view3.frame.height / 2
                view4.layer.cornerRadius = view4.frame.height / 2
        
        
        
        // Do any additional setup after loading the view.
    }


}

