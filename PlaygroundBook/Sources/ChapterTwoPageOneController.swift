//
//  ChapterTwoPageOneController.swift
//  Book_Sources
//
//  Created by Lucas Pelinzon on 13/03/19.
//

import UIKit
import PlaygroundSupport
import NaturalLanguage

@available(iOS 12.0, *)
@objc(_TtC26Exploring_Natural_Language27ChapterTwoPageOneController)
public class ChapterTwoPageOneController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    //MARK: - Properties
    var msg = "Get money fast for just 0.99$!"
    var isSpamFilterEnabled = false
    let spamFilter = try! NLModel(mlModel: SpamFilter().model)

    //MARK: - Outlets
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    //MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        checkSpam(message: msg, filter: isSpamFilterEnabled)
    }
    
    //MARK: - Custom Methods
    func checkSpam(message: String, filter: Bool){
        let result = spamFilter.predictedLabel(for: message)!
        if filter {
            classificationLabel.text = "Message classified as \(result.lowercased())."
            if result == "ham" {
                dogImage.image = UIImage(named: "Fred-10.png")
            } else {
                dogImage.image = UIImage(named: "Fred-9.png")
            }
        } else {
            classificationLabel.text = "The spam filter is off."
            dogImage.image = UIImage(named: "Fred-8.png")
        }
    }
    
    //MARK: - MessageHandler Methods
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .boolean(boolVar):
            if boolVar {
                isSpamFilterEnabled = true
            } else {
                isSpamFilterEnabled = false
            }
        case let .string(text):
            msg = text
            checkSpam(message: msg, filter: isSpamFilterEnabled)
        default:
            break
        }
    }
}
