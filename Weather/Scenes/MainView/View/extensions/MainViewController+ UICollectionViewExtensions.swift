//
//  MainViewController+ UICollectionViewExtensions.swift
//  Weather
//
//  Created by alexKoro on 8/29/21.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelView.weather?.hourlyWeather.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherViewCell", for: indexPath) as? HourlyWeatherViewCell,
              let hourlyWeather = modelView.weather?.hourlyWeather[indexPath.item]
              else {
            return UICollectionViewCell()
        }
        
        cell.timeLabel.text = hourlyWeather.time
        cell.temperatureLabel.text = hourlyWeather.temperature
        if let urlImage = OpenWeatherMapLinksManager.shared.getImageAPI(with: hourlyWeather.weather.first!.icon) {
            NetworkManager.shared.makeRequest(with: urlImage) { (data) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    cell.weatherImage.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize: CGSize{
            var minimumLineSpacing: CGFloat = 0
            if let flowLayout = hourlyWeatherCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                minimumLineSpacing = flowLayout.minimumLineSpacing
            }
            let width = (hourlyWeatherCollectionView.frame.width - minimumLineSpacing) / 3
            return CGSize(width: width, height: width)
        }
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

