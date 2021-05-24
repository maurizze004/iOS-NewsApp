//
//  ViewController2.swift
//  API-Learning
//
//  Created by Maurice Baumann on 5/24/21.
//

import UIKit
import SafariServices

struct Sections {
    let title: String
    let options: [OptionTypes]
}
enum OptionTypes {
    case staticCell(model: Options)
    case switchCell(model: SwitchOptions)
}
struct SwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackground: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}
struct Options {
    let title: String
    let icon: UIImage?
    let iconBackground: UIColor
    let handler: (() -> Void)
}

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var modals = [Sections]()
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PersonalTableViewCell.self, forCellReuseIdentifier: PersonalTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.title = "Interessen"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    func configure(){
        modals.append(Sections(title: "Land", options: [
            .staticCell(model: Options(title: "Amerika", icon: UIImage(systemName: "flag") , iconBackground: .secondaryLabel) {
                self.navigationController?.pushViewController(AmericanNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Frankreich", icon: UIImage(systemName: "flag"), iconBackground: .systemBlue){
                self.navigationController?.pushViewController(FrenchNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Italien", icon: UIImage(systemName: "flag"), iconBackground: .systemGreen){
                self.navigationController?.pushViewController(ItalienNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Österreich", icon: UIImage(systemName: "flag"), iconBackground: .systemRed){
                self.navigationController?.pushViewController(AustrianNews(), animated: true)
            })
            
        ]))
        
        modals.append(Sections(title: "Kategorien", options: [
            .staticCell(model: Options(title: "Technik", icon: UIImage(systemName: "hammer"), iconBackground: .systemGray){
                self.navigationController?.pushViewController(techNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Business", icon: UIImage(systemName: "building.2"), iconBackground: .systemBlue){
                self.navigationController?.pushViewController(buisnessNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Gesundheit", icon: UIImage(systemName: "staroflife"), iconBackground: .systemRed){
                self.navigationController?.pushViewController(healthNews(), animated: true)
            }),
            .staticCell(model: Options(title: "Sport", icon: UIImage(systemName: "sportscourt"), iconBackground: .systemTeal){
                self.navigationController?.pushViewController(sportNews(), animated: true)
            })
        ]))
        
        modals.append(Sections(title: "Zum suchen runterwischen", options: [
            .staticCell(model: Options(title: "Suchen", icon: UIImage(systemName: "magnifyingglass"), iconBackground: .systemGray3){
                self.navigationController?.pushViewController(SearchFunc(), animated: true)
            })
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = modals[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return modals.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modals[section].options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modals[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTableViewCell.identifier, for: indexPath) as? PersonalTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(_):
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = modals[indexPath.section].options[indexPath.row]
    
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/14.6
    }
}
