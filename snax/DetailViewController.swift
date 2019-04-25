//
//  DetailViewController.swift

//

import UIKit

class DetailViewController: UIViewController {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var openLabel: UILabel!
    var priceImageView: UIImageView!
    var tagLabel: UILabel!
    var image: UIImage?
    var priceImage: UIImage?
    var name: String
    var tags: [String]
    var times: [[Int]]
    var isOpen: Bool
    
    var tableView: UITableView!
    let reuseidentifier = "menuItemCellReuse"
    
    init(image: UIImage, name: String, tags: [String], priceImage: UIImage, times: [[Int]], isOpen: Bool){
        self.image = image
        self.name = name
        self.tags = tags
        self.priceImage = priceImage
        self.times = times
        self.isOpen = isOpen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = name
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = image
        view.addSubview(imageView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font =  UIFont(name: "Avenir-Book", size: 24)
        nameLabel.text = name
        view.addSubview(nameLabel)
        
        openLabel = UILabel()
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        openLabel.textColor = .gray
        openLabel.font =  UIFont(name: "Avenir-Book", size: 14)
        openLabel.text = getTimeLeft()
        view.addSubview(openLabel)
        
        priceImageView = UIImageView(frame: .zero)
        priceImageView.translatesAutoresizingMaskIntoConstraints = false
        priceImageView.contentMode = .scaleAspectFit
        priceImageView.clipsToBounds = true
        priceImageView.image = priceImage
        view.addSubview(priceImageView)
        
        tagLabel = UILabel()
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.textColor = .gray
        tagLabel.font =  UIFont(name: "Avenir-Book", size: 14)
        var tagline: String = ""
        for tag in self.tags {
            tagline += tag + ", "
        }
        tagline = String(tagline.prefix(tagline.count-2))
        tagLabel.text = tagline
        view.addSubview(tagLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: tagLabel.topAnchor, constant: 10)
            ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 175),
            ])
        NSLayoutConstraint.activate([
            priceImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            priceImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            priceImageView.heightAnchor.constraint(equalToConstant: 45),
            priceImageView.widthAnchor.constraint(equalToConstant: 45),
            ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
            ])
        NSLayoutConstraint.activate([
            openLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -2),
            openLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 1)
            ])
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: openLabel.bottomAnchor, constant: 2),
            tagLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 1)
            ])
        
    }
    
    func getTimeLeft() -> String{
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        let weekday = Calendar.current.component(.weekday, from: Date())
        
        var dayTime = times[weekday-1]
        
        if ((hour > dayTime[0] && hour < dayTime[2])||(hour == dayTime[0] && minutes >= dayTime[1])||(hour == dayTime[2] && minutes < dayTime[3])){
            if ((dayTime.count == 4) || (dayTime.count == 8 && dayTime[4] != 0 && dayTime[5] != 0)){
                if (minutes == dayTime[3]) {
                    return "Closes in \(dayTime[2]-hour-1) hours and 0 minutes"
                } else if (minutes > dayTime[3]) {
                    return "Closes in \(dayTime[2]-hour-1) hours and \(60-(minutes-dayTime[3])) minutes"
                } else {
                    return "Closes in \(dayTime[2]-hour) hours and \(60-(dayTime[3]-minutes)) minutes"
                }
            } else {
                if (minutes == dayTime[7]) {
                    return "Closes in \((dayTime[2]-hour-1)+dayTime[6]) hours and 0 minutes"
                } else if (minutes > dayTime[7]) {
                    return "Closes in \((dayTime[2]-hour-1)+dayTime[6]) hours and \(60-(minutes-dayTime[7])) minutes"
                } else {
                    return "Closes in \((dayTime[2]-hour)+dayTime[6]) hours and \(60-(dayTime[7]-minutes)) minutes"
                }
            }
        } else if (dayTime.count == 4){
            var bound = weekday
            if (bound == 7) {bound = 0}
            while (times[bound] == [0, 0, 0, 0]) {
                bound += 1
                if (bound == 7) {bound = 0}
            }
            var weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            if ((bound == weekday)||(bound==0 && weekday == 7)) {
                return "Opens tomorrow at \(timeToString(time: [times[bound][0], times[bound][1]]))"
            } else {
                return "Opens on \(weekdays[bound]) at \(timeToString(time: [times[bound][0], times[bound][1]]))"
            }
        } else if ((hour > dayTime[4] && hour < dayTime[6])||(hour == dayTime[4] && minutes >= dayTime[5])||(hour == dayTime[6] && minutes < dayTime[7])){
            if (minutes > dayTime[7]) {
                return "Closes in \(dayTime[6]-hour-1) hours and \(60-(minutes-dayTime[7])) minutes"
            } else {
                return "Closes in \(dayTime[6]-hour) hours and \(60-(dayTime[7]-minutes)) minutes"
            }
        } else {
            var bound = weekday
            if (bound == 7) {bound = 0}
            while (times[bound] == [0, 0, 0, 0]) {
                bound += 1
                if (bound == 7) {bound = 0}
            }
            var weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            if ((hour > dayTime[2] && hour < dayTime[4])||(hour == dayTime[2] && minutes >= dayTime[3])||(hour == dayTime[4] && minutes < dayTime[5])){
                return "Opens later today at \(timeToString(time: [dayTime[4], dayTime[5]]))"
            } else if ((bound == weekday)||(bound==0 && weekday == 7)) {
                return "Opens tomorrow at \(timeToString(time: [times[bound][0], times[bound][1]]))"
            } else {
                return "Opens on \(weekdays[bound])"
            }
        }
    }
    
    func timeToString(time: [Int]) -> String {
        var hr: String = "\(time[0])"
        var min: String = "\(time[1])"
        var ampm: String = "am"
        if (time[0]>12) {
            hr = "\(time[0]-12)"
            ampm = "pm"
        }
        if (time[1] < 10) {
            min = "0\(time[1])"
        }
        return "\(hr):\(min)\(ampm)"
    }
}
