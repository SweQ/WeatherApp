//
//  MainViewController.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import UIKit

class MainViewController: UIViewController {
    
    internal var modelView = MainViewModel()
    
    @IBOutlet weak var displayScrollView: UIScrollView!
    @IBOutlet weak var selectCityTableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentWeatherView: CurrentWeatherView!
    @IBOutlet weak var selectCityView: SelectCityView!
    @IBOutlet weak var hourlyWeatherCollectionView: UICollectionView!
    @IBOutlet weak var dailyWeatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialDidUpdateCurrentWeatherData()
        initialdidUpdateDailyWeatherData()
        initialdidUpdateHourlyWeatherData()
        createCollectionView()
        createTableView()
        createSelectCityTapGesture()
        createSelectCityTextField()
        setupScrollView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        heightConstraint.constant = self.view.frame.height - self.selectCityView.frame.height - topPadding
    }
    
    private func setupScrollView() {
        displayScrollView.showsVerticalScrollIndicator = false
    }
    
    private func createSelectCityTextField() {
        selectCityView.cityNameTextField.delegate = self
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textFieldDidChangeTextHandler),
            name: UITextField.textDidChangeNotification,
            object: selectCityView.cityNameTextField)
    }
    
    @objc func textFieldDidChangeTextHandler() {
        guard let prefixOfCity = selectCityView.cityNameTextField.text else {
            return
        }
        modelView.cityFilter = prefixOfCity
        selectCityTableView.reloadData()
    }
    
    internal func cleareSelectCityView() {
        selectCityView.cityNameTextField.text = ""
        selectCityTableView.isHidden = true
        modelView.cityFilter = ""
        selectCityTableView.reloadData()
        selectCityView.cityNameTextField.isHidden = true
        selectCityView.cityNameTextField.resignFirstResponder()
    }
    
    private func createSelectCityTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(sender:)))
        selectCityView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureHandler(sender: UITapGestureRecognizer) {
        selectCityTableView.isHidden = false
        selectCityView.cityNameTextField.isHidden = false
        selectCityView.cityNameTextField.becomeFirstResponder()
    }
    
    private func createCollectionView() {
        let nib = UINib(nibName: "HourlyWeatherViewCell", bundle: nil)
        hourlyWeatherCollectionView.register(nib, forCellWithReuseIdentifier: "HourlyWeatherViewCell")
        hourlyWeatherCollectionView.delegate = self
        hourlyWeatherCollectionView.dataSource = self
        hourlyWeatherCollectionView.layer.borderWidth = 0.5
        hourlyWeatherCollectionView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func createTableView() {
        selectCityTableView.delegate = self
        selectCityTableView.dataSource = self
        selectCityTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        dailyWeatherTableView.delegate = self
        dailyWeatherTableView.dataSource = self
        let nib = UINib(nibName: "DailyWeatherTableViewCell", bundle: nil)
        dailyWeatherTableView.register(nib, forCellReuseIdentifier: "DailyWeatherTableViewCell")
        selectCityTableView.isHidden = true
    }
    
    func initialDidUpdateCurrentWeatherData() {
        modelView.didUpdateCurrentWeatherData = { [unowned self]currentWeather in
            DispatchQueue.main.async {
                self.currentWeatherView.feelsLikeLabel.text = "Feels like \(currentWeather.temperatureFeels)"
                self.currentWeatherView.descriptionLabel.text = currentWeather.weather.first?.description ?? "No desc."
                self.currentWeatherView.temperatureLabel.text = "\(currentWeather.temperature)"
                self.selectCityView.cityNameLabel.text = self.modelView.city?.name ?? "No city data."
                self.currentWeatherView.humidityInfoView.descriptionLabel.text = currentWeather.humidityInfo
                self.currentWeatherView.pressureInfoView.descriptionLabel.text = currentWeather.pressureInfo
                self.currentWeatherView.windInfoView.descriptionLabel.text = currentWeather.windSpeed
                if let urlImage = OpenWeatherMapLinksManager.shared.getImageAPI(with: currentWeather.weather.first!.icon) {
                    NetworkManager.shared.makeRequest(with: urlImage) { [unowned self] (data) in
                        guard let data = data else { return }
                        DispatchQueue.main.async {
                            self.currentWeatherView.weatherImage.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }
    
    func initialdidUpdateDailyWeatherData() {
        modelView.didUpdateDailyWeatherData = { dailyWeather in
            DispatchQueue.main.async {
                self.dailyWeatherTableView.reloadData()
            }
        }
    }
    
    func initialdidUpdateHourlyWeatherData() {
        modelView.didUpdateHourlyWeatherData = { hourlyWeather in
            DispatchQueue.main.async {
                self.hourlyWeatherCollectionView.reloadData()
            }
        }
    }

}
