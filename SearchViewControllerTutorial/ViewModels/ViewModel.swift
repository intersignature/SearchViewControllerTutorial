//
//  ViewModel.swift
//  SearchViewControllerTutorial
//
//  Created by Drink Sirichai on 13/2/2564 BE.
//

import Foundation

class ViewModel {

    func getMockPersonModel() -> [Person] {

        let allJob = Job.allCases
        var models: [Person] = [Person]()

        for n in 0..<50 {
            let randInt = Int.random(in: 0..<100)
            models.append(.init(name: "name at \(n)", job: allJob[randInt % 4]))
        }

        return models
    }
}
