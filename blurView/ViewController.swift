//
//  ViewController.swift
//  blurView
//
//  Created by Виталий Бородулин on 24.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var countTap = 0
    var mainManuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurViewButtom: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Меню"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(barButtonPressed))
        
        blurView.isHidden = true
        view.addSubview(mainManuView)
        
    }
    
    
    @IBAction func blurViewButtomPressed(_ sender: UIButton) {
        self.leadingConstraint.constant -= 250
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        blurView.isHidden = true
        countTap -= 1
    }
    
    @objc func barButtonPressed(_: Any){
        while countTap != 1 {
            self.leadingConstraint.constant += 250
            countTap += 1
        }
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        blurView.isHidden = false
    }
}



