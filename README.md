# XIBInStoryBoardExample
Example of having a single mutable UIViewController loading different subviews at runtime in 2 different ways

Suppose you have two or more ViewControllers in your app which are very similar except for a couple of UIViews.

This example demonstrates two different ways of factoring a UIViewController in a XIB separate from your Storyboard, which can then load a different UIView depending on the segue which presents it.

Both examples are implemented in the same app, starting from `ViewController`.

## Example 1

`MutatingViewController` will load either `CustomView1.xib` or `CustomView2.xib` depending on the value of a property which can be set by `prepareForSegue` in `ViewController`

## Example 2

`Mutant1ViewController` and `Mutant2ViewController` both derive from `BaseViewController` and will load either `CustomView1.xib` or `CustomView2.xib` according to the value of their `mutableViewNibName` property.
