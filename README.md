# Goggles :eyeglasses:

Meet Goggles, a simple, light-weight menu bar app that allows you to resize your app window for MacOS 13 and up. Goggles is built only using Swift 5 and SwiftUI. Be sure to enable accessibility for goggles before using it. Goggles is heavily inspired by Spectales.

<img width="254" alt="Screenshot" src="https://github.com/cosmicRover/goggles/assets/41096232/32be4fd5-1a49-49f5-9487-f723c9d97562">

# Project Specs

## 1. Overview
- **Project Summary**: A handy tool to resize app windows.
- **Target Audience**: Mac users.
- **Goals**: Being able to seamlessly resize app windows using keyboard shortcuts will lead to less distractions during deep work.

## 2. Features and Requirements
- **Feature Name**: Horizontal window resizability.
- **Description**: Resize an app window to left/right hand side of the screen using a keyboard shortcut.
- **User Stories**: As a Mac user, I want to resize an app window horizontally so that I may optimize my screen real-estate for productivity.
- **Acceptance Criteria**: User must be able to resize an app window to either left/right side of the screen using two discrete keyboard shortcuts.
---
- **Feature Name**: Vertical window resizability.
- **Description**: Resize an app window to top/bottom half of the screen using a keyboard shortcut.
- **User Stories**: As a Mac user, I want to resize an app window vertically so that I may optimize my screen real-estate for productivity.
- **Acceptance Criteria**: User must be able to resize an app window to either top/bottom half of the screen using two discrete keyboard shortcuts.
---
- **Feature Name**: Fullscreen window resizability.
- **Description**: Resize an app window to full size of the screen using a keyboard shortcut.
- **User Stories**: As a Mac user, I want to resize an app window to full size so that I may optimize my screen real-estate for productivity.
- **Acceptance Criteria**: User must be able to resize an app window to full size of the screen using one discrete keyboard shortcut.

## 3. Technical Specifications
- **Technology Stack**: Swift 5, SwiftUI.
- **Security Considerations**: MacOS system permission compliance.

## 4. Design
- **UI/UX Design**: Menu item app with default system fonts and colors.
- **Accessibility**: TBD

## 5. Testing and Quality Assurance
- **Testing Strategy**:
  - Manual testing of functionality and usability of the app. A google form for users to submit feedback.
  - Unit, Integration and UI testing whereever applicable.
- **Performance Criteria**: Negligible system impact/overhead while running this app in the background.

## 6. Deployment and Maintenance
- **Deployment Strategy**: Deploy as a mac app executable using Github Actions.
- **Maintenance Plan**: Bug fixes, new features TBD.
