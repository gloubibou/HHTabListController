# HHTabListController - Vertical tab view controller

HHTabListController is an implementation of a tab controller where tabs are listed in a table view hidden behind the active view controller.
The list of tabs may be revealed using a swipe gesture or by touching a button.

Visually the implementation is similar to the sliding menu or navigation bar seen in many iOS applications. To my knowledge the idea was pioneered by the Facebook app.

The HHTabListController implementation was written for the [ACTPrinter 4.0 application](https://itunes.apple.com/app/actprinter-virtual-printer/id296083171?mt=8).
The code presented here is identical to the one used in the shipped product.

## Features

* Tab controller implemented using view controller containment
* API similar to UITabBarController
* "Unlimited" number of tabs
* Works on both iPhone and iPad
* Supports all iPhone screen sizes

## Requirements

* iOS 5.1 or later
* ARC memory management. Code for retain/release is included, but not tested

## Usage

* Copy the following to your project:
    * HHTabListCell.h
    * HHTabListCell.m
    * HHTabListContainerView.h
    * HHTabListContainerView.m
    * HHTabListController.h
    * HHTabListController.m
    * HHTabListTabsView.h
    * HHTabListTabsView.m
* Initialize an instance of HHTabListController with an array of view controllers
* Use this HHTabListController as a root view controller
* Optionally add -[HHTabListController revealTabListBarButtonItem] to your navigation bars
* Refer to the demo application for details

## License

This code is made available under the terms of the BSD license as included in the source files.
