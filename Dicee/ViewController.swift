//
//  ViewController.swift
//  Dicee
//
//  Created by Rose on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    let dicesArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    // MARK: ELEMENTS
    private let diceeLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "DiceeLogo")
        return image
    }()
    
    // хорошим тоном является нейминг, что бы в части названия отображалось название UI элемента типа diceImageView1, diceLogoImageView. Ты же не пишешь Roll, а пишешь rollButton.
    //в diceLogo ты пишешь let, а здесь var, можно везде написать let
    private var dice1: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "DiceOne")
        return image
    }()
    //пропуски между блоками кода лучше всего делать одинаковыми, допустим в одну строку.
    
    private var dice2: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "DiceSix")
        return image
    }()
    
    private lazy var rollButton: UIButton = {
        //надо задать тип кнопки, что бы отображалась анимация при нажатии (type: .system)
        let button = UIButton(type: .system)
        button.setTitle("ROLL", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        button.backgroundColor = #colorLiteral(red: 0.606883347, green: 0.1101260856, blue: 0.1197500303, alpha: 1)
        button.addTarget(self, action: #selector(rollDices), for: .touchUpInside)
        return button
    }()
    
    //   MARK: Set View
    //здесь нет setView
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage(imageLiteralResourceName: "GreenBackground").cgImage
        
        //такой блок кода лучше пустить в private extension отдельной функцией по типу
        setupView()
    }
    
    //лучше дописать private
    @objc
    private func rollDices() {
        dice1.image = dicesArray.randomElement()
        dice2.image = dicesArray.randomElement()
    }
}

//MARK: - private methods
private extension ViewController {
    func setupView() {
        addSubview()
        setConstraints()
    }
    
    func addSubview() {
        view.setupView(diceeLogo)
        view.setupView(dice1)
        view.setupView(dice2)
        view.setupView(rollButton)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            diceeLogo.widthAnchor.constraint(equalToConstant: 300),
            diceeLogo.heightAnchor.constraint(equalToConstant: 200),
            diceeLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceeLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            dice1.topAnchor.constraint(equalTo: diceeLogo.bottomAnchor, constant: 70),
            //            dice1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            dice1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            dice1.widthAnchor.constraint(equalToConstant: 100),
            dice1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            dice2.widthAnchor.constraint(equalToConstant: 100),
            dice2.heightAnchor.constraint(equalToConstant: 100),
            dice2.topAnchor.constraint(equalTo: diceeLogo.bottomAnchor, constant: 70),
            //            dice2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
            dice2.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
            
        ])
        
        
        NSLayoutConstraint.activate([
            rollButton.widthAnchor.constraint(equalToConstant: 100),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.topAnchor.constraint(equalTo: dice1.bottomAnchor, constant: 100)
            
        ])
    }
}

// MARK: Other Extensions
//такой extension лучше всего выносить в отдельный файл, что бы не засорять viewController
extension UIView {
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        //пустые строки
        
    }
}

