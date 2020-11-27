## Overview

The goal is to create a demo iOS application which makes a request to an API, parses the response, and displays the result in the UI.

## Problem

The app should consist of **two** screens:

A **Home** screen containing two elements

- Text field for entering an 'Id' Integer Value
- 'Send' Button for initiating the request to *`https://jsonplaceholder.typicode.com/posts/{id}`*

A **Details** screen containing three elements

- Navigation bar with Back button for returning to the first screen
- Title for displaying the 'title' text of the JSON response
- Text field (non-editable) for displaying the 'body' text of the JSON response

## Use-Case

- After the app is launched, the **Home** screen is displayed
- The user enters a random Integer value into to the 'Id' field and taps the `Send` button
- The app sends a https request to `https://jsonplaceholder.typicode.com/posts/{id}`, where {id} is the integer value entered by the user
- The app then parses the response from the server. If both the 'title' and 'body' fields exists, the **Details** screen should open and display the corresponding values. If either of the fields are *null*/empty/absent, an error message should be displayed on the **Home** screen.

## Requirements

- The app has to compile and run without issue. It should be stable and reasonably fool-proof, handling all obvious test cases.

## Suggestions

- MVVM Architecture
- RxSwift
- Moya for network requests

## Deliverables

The final deliverable should be a fully-functioning iOS codebase that compiles and runs within Xcode. A public GitHub repository is the preferred delivery method.
