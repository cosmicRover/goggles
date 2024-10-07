# Goggles :eyeglasses:
https://github.com/user-attachments/assets/b9f015e6-7b12-44b1-b486-a7d15274f496

Download [Goggles](https://github.com/user-attachments/files/17285138/goggles_v1.zip), a simple, light-weight menu bar app that allows you to resize your app window with keyboard shortcuts. This app is built for MacOS 13 and up using Swift 5 and SwiftUI. Be sure to enable accessibility for Goggles on first launch. This app is heavily inspired by Spectacles.

<img width="243" alt="Goggles" src="https://github.com/cosmicRover/goggles/assets/41096232/02c56ae0-b8c6-4d81-862d-74cc457b9038">

Goggles is functionally complete but requires testing.

Known issues:
- The app can be unresponsive on first launch. Quit the app using Activity Monitor and re-launch to fix the issue.

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
---
- **Feature Name**: One third window resizability.
- **Description**: Resize an app window to 1/3 size of the display, then position it to left/right hand side of the screen using a keyboard shortcut.
- **User Stories**: As a Mac user, I want to resize an app window to 1/3 size of the display so that I may optimize my screen real-estate for productivity.
- **Acceptance Criteria**: User must be able to resize an app window to 1/3 size of the display, then position to either left/right hand side using two discrete keyboard shortcuts.
---
- **Feature Name**: Two third window resizability.
- **Description**: Resize an app window to 2/3 size of the display, then position it to left/right hand side of the screen using a keyboard shortcut.
- **User Stories**: As a Mac user, I want to resize an app window to 2/3 size of the display so that I may optimize my screen real-estate for productivity.
- **Acceptance Criteria**: User must be able to resize an app window to 2/3 size of the display, then position to either left/right hand side using two discrete keyboard shortcuts.

## 3. Technical Specifications
- **Technology Stack**: Swift 5, SwiftUI.
- **Security Considerations**: MacOS system permission compliance.

## 4. Design
- **UI/UX Design**: Menu item app with default system fonts and colors.
- **Accessibility**: TBD

## 5. Testing and Quality Assurance
- **Testing Strategy**:
  - Manual testing of functionality and usability of the app.
  - Unit testing whereever applicable.
- **Performance Criteria**: Negligible system impact/overhead while running this app in the background.

## 6. Deployment and Maintenance
- **Deployment Strategy**: Deploy as a mac app executable using Github Actions.
- **Maintenance Plan**: Bug fixes, new features TBD.
