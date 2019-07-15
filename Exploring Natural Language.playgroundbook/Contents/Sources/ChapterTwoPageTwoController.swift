//
//  ChapterTwoPageTwoController.swift
//  Book_Sources
//
//  Created by Lucas Pelinzon on 13/03/19.
//

import UIKit
import PlaygroundSupport
import NaturalLanguage

@available(iOS 12.0, *)
@objc(_TtC26Exploring_Natural_Language27ChapterTwoPageTwoController)
public class ChapterTwoPageTwoController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
   
    //MARK: - Properties
    var message = "I can't stand this problem anymore!"
    let sentimentPredictor = try! NLModel(mlModel: SentimentClassifier().model)
    
    //MARK: - Outlets
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    //MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        identifyEmotions(message)
    }
    
    //MARK: - Custom Methods
    func identifyEmotions(_ text: String) {
        let result = sentimentPredictor.predictedLabel(for: text)
        classificationLabel.text = "The emotion appears to be \(result!.lowercased())."

        if result == "positive" {
            dogImage.image = UIImage(named: "Fred-12.png")
        } else {
             dogImage.image = UIImage(named: "Fred-11.png")
        }
    }
    
    //MARK: - MessageHandler Methods
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .string(msg):
            self.message = msg
            identifyEmotions(self.message)
        default:
            break
        }
    }
}
