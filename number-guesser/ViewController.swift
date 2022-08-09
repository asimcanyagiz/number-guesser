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
            
            btnReset.isHidden = false
            return
            
        }
        txtGuess.backgroundColor = UIColor.white
        
        if let numGuess = Int(txtGuess.text!){
            
            if targetNumber == numGuess {
                
                imgGuess.image = UIImage(named: "star")
                lblResults.text = "True Answer!"
                txtGuess.backgroundColor = UIColor.systemGreen
                isAnswerTrue = true
                btnReset.isHidden = false
                
            } else if numGuess < targetNumber {
                
                guessTry += 1
                imgGuess.image = UIImage(named: "up")
                stars[guessTry - 2].image = UIImage(named: "emptyStar")
                txtGuess.backgroundColor = UIColor.systemRed
                
            } else if numGuess > targetNumber {
                
                guessTry += 1
                imgGuess.image = UIImage(named: "down")
                stars[guessTry - 2].image = UIImage(named: "emptyStar")
                txtGuess.backgroundColor = UIColor.systemRed
                
            }
            
        } else {
            
            imgGuess.image = UIImage(named: "wrong")
            
        }
        
        imgGuess.isHidden = false
        print(guessTry)
        if guessTry == 6 {
            btnReset.isHidden = false
            lblResults.text = "Game Over!"
        }
        
    }
    
    
    
    
    @IBAction func btnResetClicked(_ sender: UIButton) {
        
        //everything in down for reset game session
        
        stars[0].image = UIImage(named: "star")
        stars[1].image = UIImage(named: "star")
        stars[2].image = UIImage(named: "star")
        stars[3].image = UIImage(named: "star")
        stars[4].image = UIImage(named: "star")
        
        imgNumber.isHidden = true
        imgGuess.isHidden = true
        
        btnGuess.isEnabled = false
        btnNumber.isEnabled = true
        
        txtNumber.isSecureTextEntry = true
        
        lblResults.text = ""
        
        btnReset.isHidden = true
        
        
        targetNumber = -1
        txtGuess.backgroundColor = UIColor.white
        txtGuess.text = ""
        
        guessTry = 1
        
        isAnswerTrue = false
    }
    
    
    
    
    


}

