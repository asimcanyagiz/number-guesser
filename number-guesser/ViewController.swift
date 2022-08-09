//
//  ViewController.swift
//  number-guesser
//
//  Created by Asım can Yağız on 8.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var imgNumber: UIImageView!
    @IBOutlet weak var btnNumber: UIButton!
    
    
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imgGuess: UIImageView!
    @IBOutlet weak var btnGuess: UIButton!
    
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    @IBOutlet weak var lblResults: UILabel!
    
    
    @IBOutlet weak var btnReset: UIButton!
    
    
    var stars : [UIImageView] = [UIImageView]()
    
    let maxTry : Int = 5
    var targetNumber : Int = -1
    var guessTry : Int = 1
    var isAnswerTrue : Bool = false
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stars = [star1,star2,star3,star4,star5]
        imgNumber.isHidden = true
        imgGuess.isHidden = true
        
        btnGuess.isEnabled = false
        
        txtNumber.isSecureTextEntry = true
        
        lblResults.text = ""
        
        btnReset.isHidden = true
        
    }
    
    
    @IBAction func btnNumberClicked(_ sender: UIButton) {
        
        
        if let num = Int(txtNumber.text!){
            
            targetNumber = num
            btnGuess.isEnabled = true
            btnNumber.isEnabled = false
            txtNumber.text = ""
            
        } else {
            
            imgNumber.image = UIImage(named: "wrong")
            
        }
        
        imgNumber.isHidden = false
        
    }
    
    
    @IBAction func btnGuessClicked(_ sender: UIButton) {
        
        if isAnswerTrue == true || guessTry > maxTry {
            return
        }
        txtGuess.backgroundColor = UIColor.white
        
        if let numGuess = Int(txtGuess.text!){
            guessTry += 1
            
            if targetNumber == numGuess {
                
                imgGuess.image = UIImage(named: "star")
                lblResults.text = "True Answer!"
                txtGuess.backgroundColor = UIColor.systemGreen
                
            } else if numGuess < targetNumber {
                
                imgGuess.image = UIImage(named: "up")
                stars[guessTry - 2].image = UIImage(named: "emptyStar")
                txtGuess.backgroundColor = UIColor.systemRed
                
            } else if numGuess > targetNumber {
                
                imgGuess.image = UIImage(named: "down")
                stars[guessTry - 2].image = UIImage(named: "emptyStar")
                txtGuess.backgroundColor = UIColor.systemRed
                
            }
            
        } else {
            
            imgGuess.image = UIImage(named: "wrong")
            
        }
        
        imgGuess.isHidden = false
        
    }
    
    
    
    
    @IBAction func btnResetClicked(_ sender: UIButton) {
    }
    
    
    
    
    


}

