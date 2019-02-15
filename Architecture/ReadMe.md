# Factories and Coordinator Example
# 🚧 Work In Progress 🚧
Example app to show how the coordinator pattern and factory dependency management work in a simple way

## Purpose 
I'm trying to find an architecture/techniques that are not only scalable but testable.  

Why Factories and Containers? 
- Avoids making complicated initializers and passing around multiple dependencies
- All factories are protocols so it makes mocking easy for testing purposes
- Dependency container contains all singletons and other dependencies so no global variables or optionals needed
- You don't have to know what the dependencies of the next view controller are, the container knows! 

Why Coordinators? 
- Separation of concerns, abstracts navigation logic from view controllers (great if you use different vcs for ipad and iphone)
- Allows for easy deeplinking to anywhere in the navigation stack 
- It sounds cool 😎

## Format
The sample app is very simple, it contains a tab bar controller with three tabs.  Each one has a coordinator that controls the navigation.  The app is very simple, but open the project up to find out how it's all working behind the scenes! 

The First Tab is a simple example of how to pass a model from one view controller to the next using factories and the coordinator 

The Second Tab still WIP, will be an example of the same thing but using storyboards and xibs with factories 

The Third Tab is an example of multiple dependencies that need to be passed, but you only have to pass one factory 

