<a href="https://flutter.dev/"><img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" align="right" width="6%"></a>
<a href="https://github.com/tortamque"><img src="https://github.com/user-attachments/assets/45cb4a71-832e-4b6d-b22e-34fdea8834d2" align="right" width="6%"></a>
# Pathfinder

## Description
Pathfinder is an application designed to help users solve maze challenges using the <b>A-star</b> algorithm. Developed with Flutter and Dart, it offers an intuitive interface for visualizing mazes.</br>
Built with modern software development principles, Pathfinder follows a [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) approach. It incorporates the [Repository](https://codewithandrea.com/articles/flutter-repository-pattern/) pattern and leverages the [Bloc](https://bloclibrary.dev/#/flutterbloccoreconcepts) state management library 🚀


## Table of Contents
- [Architecture](#architecture)
- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots and Demo](#screenshots-and-demo)
- [Changelog](#changelog)
- [Used Packages](#used-packages)
- [License](#license)

<a name="architecture"/></a>
## Architecture
Pathfinder fully adopts the Clean Architecture pattern, integrating both the Bloc and Repository patterns.</br> 
Clean Architecture is structured into the following layers: 
1) Data Layer
2) Domain Layer (Business Logic)
3) Presentation Layer (UI) </br></br>

Architecture for <b>API calls</b>:
![Api](https://github.com/user-attachments/assets/aa925895-7030-4c13-a671-923a6e4e7a56)

<a name="features"/></a>
## Features
- Enter an API endpoint to fetch maze challenges
- Solve mazes using the A-star algorithm for optimal pathfinding
- Verify the correctness of solutions by making requests to an API
- View correct path if the maze is solved correctly
- Select any maze to see its detailed solution, including start and end points
- Intuitive and user-friendly interface for easy navigation and interaction


<a name="supported-platforms"/></a>
## Supported platforms
Pathfinder is a cross-platform mobile application that supports both <b>Android</b> and <b>iOS</b> platforms.

<a name="installation"/></a>
## Installation
To run the Pathfinder app locally, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter and Dart installed on your system.
3. Navigate to the project directory in your terminal.
4. Run the command `flutter pub get` to install the required dependencies.
5. Connect a device or start an emulator.
6. Run the command `flutter run` to launch the app.

<a name="usage"/></a>
## Usage
1. Launch the Pathfinder app
2. Enter a valid API endpoint to fetch maze challenges. If the API is invalid, you won’t be able to proceed
3. The app will retrieve the maze problems and solve them using the A* algorithm
4. Tap the "Send results to server" button to verify the correctness of the solutions
5. The app will display the path for each solved maze
6. Select the maze whose solution you want to view
7. The app will display the solved maze in detail, including the path, start, and end points


<a name="screenshots-and-demo"/></a>
## Screenshots and Demo
### Screenshots
<img src="https://github.com/user-attachments/assets/e4a89439-d49a-41b8-b16b-765a4c6818ca" alt="Screenshot_1" width="200">
<img src="https://github.com/user-attachments/assets/3ceeb7f1-28e4-4560-8a93-64b547ccf4ef" alt="Screenshot_2" width="200">
<img src="https://github.com/user-attachments/assets/d8fb9602-f00b-4e69-9d8f-d1bfb86998c3" alt="Screenshot_3" width="200">
<img src="https://github.com/user-attachments/assets/68bf30bb-4999-46e2-9d02-f5a1d1b7e3ed" alt="Screenshot_4" width="200">

### Demo
https://github.com/user-attachments/assets/1725e64d-7940-4509-a219-70cb39054c24


<a name="changelog"/></a>
## Changelog
### [1.0] - 06.10.2024
  #### Added
 - Initial release. 🔮

<a name="used-packages"/></a>
## Used Packages
The Pathfinder app utilizes the following packages:

| Name              | Version | Link on pub.dev                                  |
|-------------------|---------|--------------------------------------------------|
| flutter_bloc      | 8.1.6   | [Link](https://pub.dev/packages/flutter_bloc)    |
| go_router         | 14.3.0  | [Link](https://pub.dev/packages/go_router)       |
| provider          | 6.1.2   | [Link](https://pub.dev/packages/provider)        |


<a name="licenses"/></a>
## License
Apache License Version 2.0
