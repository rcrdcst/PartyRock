//
//  ViewController.swift
//  partyRock
//
//  Created by ricardo silva on 18/02/2017.
//  Copyright © 2017 ricardo silva. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LvcBlcRCeas\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")

        let p2 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LvcBlcRCeas\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")

        let p3 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LvcBlcRCeas\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")

        let p4 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LvcBlcRCeas\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")

        let p5 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LvcBlcRCeas\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")

        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {

            let partyRock = partyRocks[indexPath.row]

            cell.updateUI(partyRock: partyRock)

            return cell

        } else {

            return UITableViewCell()

        }


    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let partyRock = partyRocks[indexPath.row]

        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

