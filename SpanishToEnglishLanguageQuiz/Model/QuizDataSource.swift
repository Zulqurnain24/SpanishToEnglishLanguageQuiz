//
//  QuizDataSource.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Define Word struct
struct Word {
    var english: String?
    var spanish: String?
}

class QuizDataSource {
    private var quizArray = [Word]()
    
    func getQuizArray() -> [Word] {
        return quizArray
    }
    
    func populateArrayFromJSONFile(completionHandler: ([Word]) -> Void) {
        //load from json
        if let path = Bundle.main.path(forResource: "words.json", ofType: "") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let jsonResult = jsonResult as? [Dictionary<String, String>] {
                    jsonResult.forEach({ element in
                        guard let word = Word(english: element["text_eng"] as String?, spanish: element["text_spa"] as String?) as Word? else { return }
                        quizArray.append(word)
                    })
                    completionHandler(quizArray)
                }
            } catch let error {
                // handle error
                print("Error : \(error.localizedDescription)")
            }
        }
    }
}
