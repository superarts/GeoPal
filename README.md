# GeoPal

A location sharing app. `Cocoapods` are added into repo, so just clone then build or test with `Xcode 9.2`.

## Architecture

### VIPER

GeoPal is constructed using [VIPER](https://www.objc.io/issues/13-architecture/viper/). Since `Map` is the only implemented part, no `routing` is added yet. And `DataStore` is named as "Manager" in this project, as one word is shorter than 2.

### Dependency Injection

No DI framework like `Swinject` or `DIP` is introduced in this project. However, they can be easily added in as a different version of `DependencyManager`. Currently a really simple `ManualDependencyManager` is used to handle dependency injection.

### Protocols

Protocols are heavily used in this project. There are some really simple classes with protocols like `SimpleAnnotation`, but protocols and related dependencies should be added later.

## Features

Most of the following features are not finished yet.

### MapViewController

- Send and receive Google Place information to any of a user’s contacts (share through email, sms, etc) 
- Allow users to view selected places as markers on Google Maps. 
- Include an autocomplete search bar for places (implemented)
	
### ContactViewController

- List a user’s contacts from their phone 

### HistoryViewController

- For each of a user’s contacts, maintain the history for each place sent to or received from that user. 

### PlaceViewController

- Allow users to view details of places 
- Include deep-links in messages in order to display received Place information, or to navigate to relevant sections of the app. 

### Misc

- Use of XCTesting 
- Needs to work with XCode9