//#-hidden-code
import PlaygroundSupport

let proxy = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 # Identifying Emotions in Text
 
 Another cool dataset that we can use to demonstrate the potential of the Natural Language Framework is the [Large Movie Review Dataset](http://ai.stanford.edu/~amaas/data/sentiment/), which is used for binary sentiment classification.
 
 In other words, a model trained with this dataset is able to recognize whether the provided text contains mostly **positive** or **negative** emotions. You can test this by altering the ``text`` variable below and running your code. Fred will react accordingly.
 
 He looks a little sad right now, so let’s **cheer him up** with something positive! 😌
 */
var text = /*#-editable-code*/"I can't stand this problem anymore!"/*#-end-editable-code*/
/*:
 Once you’re done, let’s head over to our [final example](@next). 😁
*/
//#-hidden-code
proxy.send(.string(text))

if text != "I can't stand this problem anymore!" {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! Once you're ready, ready over to the next page 😁")
}
//#-end-hidden-code
