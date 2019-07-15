//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

// Instantiates a specific new instance of a live view given a page identifier.
public func instantiateLiveView(pageIdentifier: (Int,Int)) -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)
    switch pageIdentifier {
    case (1,1):
        return storyboard.instantiateViewController(withIdentifier: "ChapterOnePageOneController")
    case (1,2):
        return storyboard.instantiateViewController(withIdentifier: "ChapterOnePageTwoController")
    case (2,1):
        return storyboard.instantiateViewController(withIdentifier: "ChapterTwoPageOneController")
    case (2,2):
        return storyboard.instantiateViewController(withIdentifier: "ChapterTwoPageTwoController")
    case (2,3):
        return storyboard.instantiateViewController(withIdentifier: "ChapterTwoPageThreeController")
    default:
        fatalError("A valid ViewController on LiveView.storyboard could not be found.")
    }
}
