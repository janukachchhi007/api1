//
//  ViewController.swift
//  api1
//
//  Created by R94 on 01/04/23.
//

import UIKit

struct Api : Codable
{
    var error: Bool
    var data :[Getapi]
}
struct Getapi :Codable
{
    var srno : String
    var id: String
    var area_name:String
    var city: String
    var stats : String
    var added_by : String
    var date_time : String
    var operation :String
    var is_verified : String
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var api1 : [Getapi] = []
    
    @IBOutlet weak var tableView1: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        tableView1.reloadData()
    }
    func getdata()
    {
        let url = URL(string: "https://myct.store/Mobile_Services/user/v2/index.php/get_area")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        URLSession.shared.dataTask(with: ur) { data, responce, error in
            do{
                if error == nil
                {
                    let arr = try JSONDecoder().decode(Api.self, from: data!)
                    print(arr)
                    self.api1 = arr.data
                    DispatchQueue.main.async {
                        self.tableView1.reloadData()
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return api1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.l1.text = api1[indexPath.row].id
        cell.l2.text = api1[indexPath.row].city
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

