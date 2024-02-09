//
//  ViewController.swift
//  Weather
//
//  Created by 이희웅 on 2023/06/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var citiNameTextField: UITextField!
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherDescriptionLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    
    @IBOutlet var weatherStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFatchWeatherButton(_ sender: UIButton) {
        if let cityName = self.citiNameTextField.text{
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    @IBAction func DidEndOfExitTextfield(_ sender: UITextField) {
        if let cityName = sender.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInformation : WeatherInformation){
        self.cityNameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first{
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = String(format:"%.2f℃", weatherInformation.temp.temp - 273.15)
        self.minTempLabel.text = String(format:"%.2f℃", weatherInformation.temp.tempMin - 273.15)
        self.maxTempLabel.text = String(format:"%.2f℃", weatherInformation.temp.tempMax - 273.15)
        
//        self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))℃"
//        self.minTempLabel.text = "최저 : \(Int(weatherInformation.temp.temp_min - 273.15))℃"
//        self.maxTempLabel.text = "최대 : \(Int(weatherInformation.temp.temp_max - 273.15))℃"
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title : "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCurrentWeather(cityName:String){
        
        // API Key is needed : see detail more @
        let apiKey : String = ""
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)") else {return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            let successRange = 200 ..< 299
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode){
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
                
                // 네트워크 작업은 별도의 스레드에서 진행되고 작업이 완료되어도 메인스레드로 돌아오지 않음
                // 메인스레드에서 작업할 수 있도록 비동기 코드블럭을 작성
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                }
            }
            else{
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.message)
                }
                debugPrint(errorMessage)
            }
//            self.configureView(weatherInformation: weatherInformation)
            
        }.resume()
    }
}

