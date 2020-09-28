//
//  Score.swift
//  diceRoll
//
//  Created by Subhrajyoti Chakraborty on 28/09/20.
//

import Foundation

class Score: Codable, Identifiable {
    let id = UUID()
    var scoreStr = ""
}

class Results: ObservableObject {
    static let savedKey = "ResultsData"
    @Published var resultList: [Score]
    
    init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent(Self.savedKey)
        
        do {
            let data = try Data(contentsOf: filePath)
            let decodedData = try JSONDecoder().decode([Score].self, from: data)
            self.resultList = decodedData
            return
        } catch {
            print("\(error.localizedDescription)")
        }
        
        self.resultList = []
    }
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
        let filePath = getFilePath().appendingPathComponent(Self.savedKey)
        do {
            let data = try JSONEncoder().encode(resultList)
            try data.write(to: filePath, options: [.atomicWrite, .completeFileProtection])
        } catch  {
            print("\(error.localizedDescription)")
        }
    }
    
    func add(_ score: Score) {
        resultList.append(score)
        save()
    }
}
