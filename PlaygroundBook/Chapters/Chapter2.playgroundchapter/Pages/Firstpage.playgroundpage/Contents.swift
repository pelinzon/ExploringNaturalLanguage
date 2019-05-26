//#-hidden-code
import PlaygroundSupport

let proxy = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 # Understanding Custom Models
 
 To me, the greatest thing about the Natural Language Framework is the ability to use **custom NLP models**. In this chapter, we will explore a couple of examples by utilizing models that were trained on **CreateML** and imported into this Playground Book.
 
 Fred will help us again to take a look at three publicly available **datasets** to get to know some of the possibilities this framework brings to light. Let’s see if he has received proper training! 😎
 
 ## Filtering the Messages
 
 It appears that our front yard is full of unwanted messages. How can we get rid of them? 😣
 
 To get started, let’s set ``filterSpam`` variable below to true and run your code. This should implement a model trained with the [SMS Spam Collection Dataset](http://www.dt.fee.unicamp.br/~tiago/smsspamcollection/) and Fred will successfully stop any undesirable spam from reaching our yard.
 */
 var filterSpam = /*#-editable-code*/false/*#-end-editable-code*/
/*:
 Now let’s check if the algorithm really works. The variable ``letter`` below currently contains a spam message, and the ``SpamFilter`` model correctly identifies it as such. Try switching it up and set its value to a normal message you would send to a friend, and then run your code.
 */
 var msg = /*#-editable-code*/"Get money fast for just 0.99$!"/*#-end-editable-code*/
/*:
 If your message doesn’t contain spam you should see that Fred fetched the letter and will let it through. Let's see how he deals with [identifying emotions](@next). 😁
 */
//#-hidden-code
proxy.send(.boolean(filterSpam))
proxy.send(.string(msg))

if filterSpam && msg != "Get money fast for just 0.99$!" {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! Once you're ready, ready over to the next page 😁")
}

//#-end-hidden-code
