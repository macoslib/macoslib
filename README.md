### About
This is the MacOSLib project for [Xojo](http://www.xojo.com) (formerly Real Studio).

It provides additional OS X specific functionality that Xojo's own framework doesn't offer.

It even has some cross-platform functionality in order to access Mac specific data on Windows and Linux (e.g. plist files).

### How to use

If you've downloaded the zip file, double-click the macoslib.rbvcp file to open it in the Xojo IDE. This is a project containing lots of examples, modules and macoslib itself. Run the project and play with the examples (see menu bar) to find out all the things you can do with it.

Now, to use that power in your own apps, you need to copy the macoslib folder in the Navigator (the list on the left hand side of Xojo) - don't copy it from the Finder, it won't work. Next, open your own project and paste the folder in. Now you can access MacOSLib's functionality.

### How to contribute

If you use the macoslib and have implemented a fix or improvement, the best way to send this change to us is by using github:

After signing up with github, you create a fork of the main [macoslib repository](https://github.com/macoslib/macoslib/). Now you have your own copy of the lib on github.
Then you download this fork of yours to your computer and add your fix to it. Then you push your changes back to github.
Lastly, you create a new "pull request" for your change(s). This will notify the maintainers of the main macoslib and let us review your changes quickly. If all looks good, we'll merge it into the main version and we're done.

Here's an example where a user not part of the "macoslib team" submitted a small fix, which got merged in almost instantly: https://github.com/macoslib/macoslib/pull/129 

This is much easier for us than if you send us modified code that we then have to merge with the current version, possibly causing new bugs due to out-of-sync issues.

Also, if you add new functionality, please provide some text code that verifies that your code actually works. We've had it happen several times that code got added that was never tried out and didn't work at all.

If it's low level code, simply add some test code to the App class. There are methods such as "TestCocoa" where you could add code for cocoa related testing. If it's more complex stuff you've added, especially if it's UI related, add a new window and include it into the menu, similarly to all the other Example windows. Those "Example windows" are not just meant as examples to new users but also let you make sure that the code actually works.