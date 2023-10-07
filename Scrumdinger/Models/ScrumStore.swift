//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 07/10/2023.
//

import Foundation

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrum.data")
    }
    
    /// this function is used to load data form local storage by loading it using the function `fuleUrl()`
    /// this function is used to get the file path from the document folder
    func load() async throws {
        // first we defiend the data type of the task
        // 1. A list of Daily Scrum
        // 2. An error to handel if any thing goas wrong
        let task = Task<[DailyScrum], Error>{
            // first we get the file path
            let fileUrl = try Self.fileUrl()
            // we make sure that the file exist if not return an empty list
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            // if there is data in the file we decode it useing json decoder
            // to return a normal list of daily scrum
            let dailyScrum = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrum
        }
        // after creating the task we awit for it to load
        let scrums = try await task.value
        // when the task is complited we set the scrums var from the class to be
        // equal to scrums that came from the file that the task returns
        self.scrums = scrums
    }
    
    /// This function is used to save data into file in user document folder
    /// by getting the file path from `fileUrl()` function
    /// we encode the data into json file
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outPutFile = try Self.fileUrl()
            try data.write(to: outPutFile)
        }
        _ = try await task.value
    }
    
}
