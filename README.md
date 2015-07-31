What is Pitch Perfect?

It is an iPhone app that allows users to record their voice and will then
modulate the recorded audio to sound like a Chipmunk or Darth Vader.
This app will also let the user speed up or slow down the rate of playback.
This app also uses echo and reverberations effects.

How is it made?

Fundamentally, it uses the MVC (Model-View-Contoller) pattern in swift.

This app uses Outlet and Outlet and Action connections between the views and
view controllers. Delegates help navigate between two scenes in the app using
UINavigationController.

The app uses AVFoundation’s AVAudioEngine class to play audio. Also, the
AVAudioPlayer instance has the playAtTime method, which allows us to schedule
sound for future play, needed for making echoes and reverbs!

The app also uses Segues, which helps us communicate from one view controller
to the next. In this app, you see the first view controller where you record
a sound and a segue will take to the next view, where you will see the results.

How to use it?

Just download the app on your phone and then follow instructions on the screen!
