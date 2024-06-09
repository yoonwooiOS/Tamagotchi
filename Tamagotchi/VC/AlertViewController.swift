//
//  AlertViewController.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/9/24.
//

import UIKit
import SnapKit
class AlertViewController: UIViewController {
    
    let alertView = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let contourLine = UIView()
    let buttonContourLine = UIView()
    let startButton = UIButton()
    let cancelButton = UIButton()
    
    var data:Tamagotchi?
    
    init(data: Tamagotchi) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data!)
        setUphierarchy()
        setUpLayout()
        setupUI()
        
        
    }
    func setUphierarchy() {
        
        view.addSubview(alertView)
        alertView.addSubview(imageView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(contourLine)
        alertView.addSubview(messageLabel)
        alertView.addSubview(buttonContourLine)
        
    }
    
    func setUpLayout() {
        
        alertView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.width.equalTo(280)
            $0.height.equalTo(388)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(alertView.safeAreaLayoutGuide)
            $0.top.equalTo(alertView.safeAreaLayoutGuide).offset(40)
            $0.size.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(imageView)
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.width.equalTo(imageView.snp.width).inset(12)
            $0.height.equalTo(20)
        }
        
        contourLine.snp.makeConstraints {
            $0.centerX.equalTo(alertView.safeAreaLayoutGuide)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.width.equalTo(200)
            $0.height.equalTo(1)
        }
        
        messageLabel.snp.makeConstraints {
            
            $0.top.equalTo(contourLine).offset(8)
            $0.centerX.equalTo(alertView.safeAreaLayoutGuide)
            $0.width.equalTo(contourLine)
            $0.height.equalTo(60)
            
        }
        
        let vStack = UIStackView(arrangedSubviews: [cancelButton, startButton])
        vStack.axis = .horizontal
        vStack.distribution = .fillEqually
        vStack.spacing = 0
        
        alertView.addSubview(vStack)
        vStack.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        
        buttonContourLine.snp.makeConstraints {
            $0.bottom.equalTo(vStack.snp.top).offset(-0.5)
            $0.height.equalTo(1)
            $0.width.equalTo(alertView)
        }
        
        
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor.basicColor, for: .normal)
        cancelButton.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 0.2)
        cancelButton.addTarget(self, action: #selector(cancelButtonHandler), for: .touchUpInside)
        
        
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(UIColor.basicColor, for: .normal)
        startButton.addTarget(self, action: #selector(doneButtonHandler), for: .touchUpInside)
        
        
    }
    
    
    
    func setupUI() {
        guard let alertData = data else { return }
        
        
        
        alertView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        alertView.layer.cornerRadius = 15
        alertView.clipsToBounds = true
        
        imageView.image = UIImage(named: alertData.image)
        
        titleLabel.text = alertData.name
        titleLabel.primaryUILabel(font: 10)
        
        contourLine.backgroundColor = UIColor.basicColor
        messageLabel.textColor = UIColor.basicColor
        messageLabel.backgroundColor = .clear
        messageLabel.text = alertData.describe
        messageLabel.font = .systemFont(ofSize: 10)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        buttonContourLine.backgroundColor = UIColor.basicColor
    }
    @objc func doneButtonHandler(_ sender: UIButton) {
        
        guard let selectedData = data else { return }
        print(selectedData)
        Tamagotchi.savedImage = selectedData.image
        Tamagotchi.savedName = selectedData.name
        Tamagotchi.savedData.toggle()
        
        print(Tamagotchi.savedImage!)
        print(Tamagotchi.savedName!)
        print(Tamagotchi.savedData)
        UserDefaults.standard.set( Tamagotchi.savedData, forKey: "signUp")
        UserDefaults.standard.setValue( Tamagotchi.savedImage, forKey: "TamagotchiImage")
        UserDefaults.standard.setValue( Tamagotchi.savedName, forKey: "TamagotchiName")
        
        let mainVC = MainViewController()
        let ncMainVC = UINavigationController(rootViewController: mainVC)
        ncMainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(ncMainVC, animated: true, completion: nil)
        
        //        print(Tamagotchi.savedData)
        
        
    }
    
    @objc func cancelButtonHandler(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}




