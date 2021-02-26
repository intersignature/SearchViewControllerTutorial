//
//  PersonCollectionViewCell.swift
//  SearchViewControllerTutorial
//
//  Created by Drink Sirichai on 13/2/2564 BE.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(_ person: Person) {

        name.text = person.name
        job.text = person.job.title
    }
}
