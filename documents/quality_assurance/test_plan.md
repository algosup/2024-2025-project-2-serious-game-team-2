<h1 style="color: #666">Test Plan</h1>

<details>
    <summary style="color: #999">Table of content</summary>

- [1. Introduction](#1-introduction)
    - [1.1 Purpose of the Test Plan](#11-purpose-of-the-test-plan)
    - [1.2 Scope of Testing](#12-scope-of-testing)
    - [1.3 References](#13-references)
    - [1.4 Glossary](#14-glossary)

- [2. Test Items](#2-test-items)
    - [2.1 Features to be Tested](#21-features-to-be-tested)
    - [2.2 Features Not to be Tested](#22-features-not-to-be-tested)

- [3. Testing Strategy](#3-testing-strategy)
    - [3.1 Types Objectives](#31-types-of-testing)
    - [3.2 Test Levels](#32-test-levels)
    - [3.3 Testing Methods](#33-test-techniques)
    - [3.4 Risk-Based Testing](#34-risk-based-testing)
    - [3.5 Test Deliverables](#35-test-deliverables)

- [4. Test Case Design](#4-test-case-design)
    - [4.1 Test Case Format](#41-test-case-format)
    - [4.2 Sample Test Cases](#42-sample-test-cases)
    - [4.3 Test Case Design Guidelines](#43-test-case-design-guidelines)
    - [4.4 Test Case Hosting](#44-test-case-tool)

- [5. Risk Management](#5-risk-management)

</details>
<br>
<br>

## 1. Introduction

### 1.1 Purpose of the Test Plan

The purpose of this Test Plan is to define the overall testing approach, scope, and objectives for testing the game.
This game is a serious game designed to address climate change awareness through interactive gameplay.
The goal of this test plan is to ensure that the game functions as expected, meets its design and performance goals, and delivers a satisfying user experience.

The test plan will guide the testing activities throughout the game's development lifecycle, from early development to the final release.
It will outline the types of testing to be performed, the testing methods, tools, resources, and deliverables.
The plan will also define the responsibilities of the testing part and set timelines for testing tasks, ensuring that quality is built into the game and that it meets the required standards.

Additionally, this test plan will help identify potential defects, risks, or issues early in the process, which will allow for quick resolution.
The plan is meant to facilitate communication between developers, testers, and other stakeholders to ensure that the product is both technically sound and aligned with the intended educational goals.


### 1.2 Scope of Testing

This test plan will cover all areas related to the functionality, usability, performance, and compatibility of the game. The testing process will ensure that all key features work as intended, are free from critical defects, and are usable by players. The primary focus will be on making sure the game provides an educational experience on climate change.

  

**The specific testing areas will include, but may not be limited to:**

**Game Functionality:** Ensuring core gameplay features, such as icon interactions, pop-up triggers, and choices within the game, work correctly. This will also involve verifying the smooth flow of questions, player choices, and subsequent game responses.

**User Interface (UI) Testing:** Verifying that the interface is intuitive, easy to navigate, and functions properly. This includes interactions with on-screen elements, such as buttons, icons, and pop-ups, ensuring that the game is user-friendly and meets accessibility standards.

**Visual and Audio Feedback:** Testing the responsiveness and appropriateness of visual and/or audio cues that provide feedback to the player, including those related to choices made, game progress, or errors.

**Cross-Platform Compatibility:** Testing the game across different devices to ensure compatibility and responsiveness, especially if the game needs to be accessible on different platforms.

**Error Handling:** Ensuring that the game handles errors gracefully, providing the user with clear error messages and ensuring that no crashes or unexpected behaviors occur.

The scope will exclude areas that are outside the game’s direct functionality or external systems not related to gameplay. These exclusions might include things like backend data verification (unless it’s tied directly to gameplay), integration with external systems (if any), post-launch analytics unless they impact gameplay features, and information accuracy.


### 1.3 References

This test plan will use the following documents, tools, and resources to guide the testing process:

**Requirements Specifications:** A list of functional and non-functional requirements for the game, including educational goals (i.e., to inform players about climate change) and technical requirements (e.g., performance, load times, browser compatibility).

**Functional Specifications (FS):** This document outlines the game’s design, mechanics, and intended user experience. The FS will provide crucial information about how the game is supposed to function and what the expected user interactions are.

**Technical Specifications (TS) :** This document outline the game's development requirements, including naming convention, file management, and code structure. The TS will provide important information about how the game is developed.

**Project Schedule:** A timeline of the development and testing phases, including milestones, deliverables, and deadlines for each stage of the project.

**Mockups/Prototypes:** Any visual designs, wireframes, or prototypes that show the intended appearance and layout of the game. These will be referenced during UI testing to ensure that the game’s design matches the original vision.

These documents and resources serves the understanding of the expected behavior of the game, defining the test cases, and ensuring that the game meets all requirements.


### 1. 4 Glossary

| Term                             | Definition                                                                                                                                                        |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Icon Selection**               | Refers to the feature where players select icons as part of gameplay. The icons trigger actions like opening pop-ups or displaying questions.                     |
| **Pop-up**                       | A small window or overlay that appears on the screen in response to an action or event, showing information, questions, or choices.                               |
| **Choices**                      | Different options presented to players during gameplay, which may affect the game’s outcome or provide further educational content.                               |
| **Game Flow**                    | The sequence and structure of interactions that guide the player through the game, including transitions, events, and decision points.                            |
| **UI (User Interface)**          | The visual elements of the game that players interact with, such as buttons, menus, icons, pop-ups, etc.                                                          |
| **Performance Testing**          | A type of testing focused on assessing how well the game performs under various conditions, like load times, user interactions, or different environments.        |
| **Cross-Platform Compatibility** | Testing the game across different devices, operating systems, and browsers to ensure it works consistently in various environments.                               |
| **Usability**                    | The ease with which players can understand, interact with, and enjoy the game. Focuses on ensuring intuitive navigation and interaction with the game's features. |
| **GitHub Actions**               | A [GitHub](https://github.com) tool that allows to create eveything related to quality assurance.                                                                 |

<br>
<br>

## 2. Test Items

### 2.1 Features to be Tested

The following key features of the **Planisphere game** will be included in the testing process:

| Feature                          | Description                                                                                           |
|----------------------------------|-------------------------------------------------------------------------------------------------------|
| **Icon Selection**               | The game allows the player to interact with various icons. Testing will focus on ensuring that selecting an icon triggers the correct behavior, such as opening pop-ups or navigating between sections. |
| **Pop-up Triggers**              | The game presents pop-ups based on the player's actions. Testing will verify that pop-ups appear at the correct times, contain the correct information, and respond to user interactions properly (e.g., closing, progressing to next part). |
| **Question and Choices Flow**    | The game provides questions and choices to the player based on certain actions. Testing will ensure that questions are displayed correctly, choices are selectable, and the player’s choices lead to the expected outcomes or next steps. |
| **Game Navigation**              | The flow between different parts of the game (sections, activities, and interactions) will be tested to ensure smooth transitions, correct screen rendering, and proper state management between each section. |
| **UI Responsiveness**            | The interface needs to adapt to different screen sizes and devices. Testing will include verifying that UI elements (buttons, icons, pop-ups) resize and realign correctly for various screen resolutions and device types (e.g., mobile, tablet, desktop). |
| **Visual and Audio Feedback**    | The game should provide appropriate feedback to the player, such as visual cues when an action is taken or audio feedback when an answer is selected. Testing will ensure that feedback is triggered correctly and is appropriate for the context of the gameplay. |
| **Error Handling**               | Testing will ensure that the game handles errors gracefully. For example, when an invalid input occurs or if an action is not possible, the game should show a helpful message, prevent crashes, and maintain stability. |
| **Game Progression**             | The game should progress correctly based on the player's actions and choices. Testing will verify that the game tracks the player's progress and allows them to continue to subsequent levels, challenges, or screens. |
| **Performance under Load**       | The game should perform well under expected usage conditions. Performance testing will focus on load times, frame rates, and response times during regular gameplay and under peak load (e.g., multiple players, if multiplayer functionality exists). |

### 2.2 Features Not to be Tested

The following areas are **out of scope** for this test plan and will **not** be tested:

| Feature                          | Reason                                                                                                 |
|----------------------------------|--------------------------------------------------------------------------------------------------------|
| **Content Accuracy**             | The correctness and relevance of educational content, such as climate change-related facts or figures presented in the game, will not be checked due to a lack of time |
| **Backend and Server-Side Logic**| Any server-side components, databases, or external API integrations will not be tested unless they directly affect gameplay features (e.g., retrieving dynamic content). |
| **Multiplayer Features**         | If the game does not include multiplayer functionality in this version, any features related to multiplayer (e.g., player vs. player interaction, shared progress) will not be tested. |
| **Advanced Analytics Integration** | The game may collect analytics data, but testing the accuracy, collection, or processing of this data is not in scope unless it directly impacts gameplay. |
| **Third-Party Services**         | Any external services or integrations, such as social media sharing, in-app purchases, or advertising platforms, will not be tested unless they are central to the gameplay experience. |
| **Post-Launch Monitoring**       | While post-launch data gathering and monitoring might be important, they fall outside the scope of this test plan, as the focus is on pre-release testing of features and functionality. |

<br>
<br>

## 3. Testing Strategy

### 3.1 Testing Objectives

The primary objectives of the testing strategy are to:

- **Ensure Functionality**: Verify that all interactive elements of the game, including icon selections, pop-ups, choices, and transitions, work as expected and do not cause any system errors or crashes.
- **Guarantee User Experience**: Validate that the game is intuitive, easy to navigate, and offers a smooth user experience. The game should provide appropriate visual and audio feedback, be visually appealing, and ensure that users can progress through the game without confusion or frustration.
- **Ensure Performance**: Assess the game's responsiveness, loading times, and behavior under various performance conditions, including multiple devices and network conditions.
- **Cross-Platform Compatibility**: Ensure the game performs consistently across different Operation Systems, screen sizes, and devices.
- **Identify and Resolve Bugs**: Detect any defects or issues in the game’s functionality, UI, or content, and ensure they are properly addressed before the release.

### 3.2 Test Levels

The testing process will be divided into multiple levels to ensure comprehensive coverage. Each level focuses on a specific aspect of the game’s quality:

- **Integration Testing**: Ensures that different components of the game (e.g., the icon selection system, pop-ups, question/choice mechanisms) work together smoothly. This level of testing will ensure that all features function correctly when integrated.
- **System Testing**: Conducted to validate that the complete game functions as intended. This level will include testing the entire gameplay loop, the flow between different sections, and the interaction of all components. 
- **Regression Testing**: Ensures that new changes or updates to the game do not negatively affect existing functionality. This will be conducted after any code updates or bug fixes are implemented.
- **Usability Testing**: Focuses on the user experience (UX), ensuring that the game is intuitive, easy to navigate, and enjoyable to play. It involves assessing whether players can complete tasks, interact with features, and progress through the game without difficulty.
- **Performance Testing**: Tests how well the game performs under various conditions, including loading times, memory usage, and response times. This will include stress testing the game under different network speeds and device specifications.
- **Compatibility Testing**: Verifies that the game works on various devices and operating systems.
- **Acceptance Testing**: Performed to ensure the game meets the requirements and expectations designers, developers, and product managers. This is typically the final stage of testing before the game is released.

### 3.3 Testing Methods

The following methods will be employed during the testing process:

- **Manual Testing**: Most of the testing will be done manually by the QA team. Test cases will be executed by the testers, who will simulate user interactions, identify bugs, and report issues. Manual testing is essential for usability and exploratory testing, where testers try to uncover unexpected issues or flaws.
- **Exploratory Testing**: Testers will explore the game without predefined test cases, focusing on potential edge cases or interactions that may not have been anticipated in the test cases. This type of testing is especially useful for finding unexpected bugs and user experience flaws.
- **User Testing**: This may involve bringing in a sample group of players (could be within the target audience) to interact with the game and provide feedback on usability, educational value, and overall satisfaction. This feedback will help ensure that the game achieves its intended educational purpose and is enjoyable to play.
- **A/B Testing** (if applicable): If there are multiple versions of a feature (e.g., different types of questions or pop-ups), A/B testing can be used to compare which version performs better in terms of user engagement, learning outcomes, or other relevant metrics.

### 3.4 Risk-Based Testing

To focus testing efforts on the most critical and high-risk areas, a risk-based testing approach will be applied. This will prioritize testing efforts on features that are most likely to affect the user experience or gameplay. Some key high-risk areas will include:

- **User Interaction Flow**: The sequence of player actions, particularly the icon selection, pop-up interactions, and choices, is crucial to the game’s success. Any issues in these areas could significantly hinder gameplay.
- **Cross-Platform Compatibility**: With a wide range of potential devices and screen sizes, compatibility testing will prioritize the most commonly used platforms, such as mainstream desktop to reduce the risk of poor user experience across unsupported platforms.
- **Performance**: Ensuring that the game performs well under various conditions is critical for providing a smooth and enjoyable user experience. Performance testing will focus on detecting memory leaks, excessive load times, or frame rate issues that could disrupt gameplay.

### 3.5 Test Deliverables

The following deliverables will be produced throughout the testing process:

- **Test Plan**: This document, outlining the overall strategy, test cases, and approach for testing the game.
- **Test Cases**: A detailed list of individual test scenarios that cover all features and functionality to be tested, along with expected results.
- **Bug Reports**: A record of any defects or issues found during testing, including severity, steps to reproduce, and the status of the issue (open, fixed, verified).

<br>
<br>

## 4. Test Case Design

Test cases form the core of the testing process. They provide detailed instructions on how to verify the functionality and features of the game. This section outlines the design, structure, and key components of the test cases that will be used in testing the game.

### 4.1 Test Case Format

Each **Test Case** will follow a standard format to ensure clarity, consistency, and completeness. Below is the typical format for a test case:

| Field                         | Description                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------|
| **ID**               | A unique identifier for the test case (e.g., TC001). This helps in tracking test cases throughout the process. |
| **Title**            | A brief, descriptive title summarizing the test case (e.g., "Verify Icon Selection Triggers Pop-up"). |
| **Test Objective**             | A short description of the purpose of the test (e.g., "To ensure that selecting an icon opens the correct pop-up window"). |
| **Preconditions**              | The conditions or setup required before the test case can be executed (e.g., "User is logged in," "The game is launched"). |
| **Test Steps**                 | A detailed list of steps that need to be followed to execute the test (e.g., "Click on the icon in the lower-left corner of the screen"). |
| **Expected Results**           | A description of what should happen after each step or at the end of the test (e.g., "A pop-up window with a climate change-related question appears"). |
| **Actual Results**             | To be filled in during test execution. The observed outcome of the test (e.g., "Pop-up window appears as expected"). |
| **Pass/Fail Criteria**         | A clear definition of what constitutes a pass or failure for this test case (e.g., "The pop-up window must contain the correct question and be fully functional"). |
| **Postconditions**             | Any conditions that should be verified after the test case is executed (e.g., "The user can proceed to the next screen after responding to the pop-up"). |                                                  |
| **Date**                       | The date on which the test case was executed.                                                         |

### 4.2 Sample Test Cases

Here is an fictive test case for the game, in order to demonstrate the structure:

#### Test Case 1: Icon Selection Triggers Pop-up

| Field                         | Description                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------|
| **Test Case ID**               | TC001                                                                                                |
| **Test Case Title**            | Verify Icon Selection Triggers Pop-up                                                                |
| **Test Objective**             | To ensure that selecting an icon opens the correct pop-up window containing relevant information.    |
| **Preconditions**              | - The game is loaded and the user is at the main screen.                                             |
| **Test Steps**                 | 1. Click on the "Climate Change Icon" on the main screen.                                            |
|                               | 2. Wait for the pop-up window to appear.                                                              |
| **Expected Results**           | 1. A pop-up window should appear with a question related to climate change.                          |
|                               | 2. The window should be interactive, allowing the user to proceed or close it.                        |
| **Actual Results**             | To be filled in during test execution.                                                               |
| **Pass/Fail Criteria**         | - The pop-up window must contain a climate change-related question.                                  |
|                               | - The window must be responsive, allowing interaction and proper closure.                             |
| **Postconditions**             | The user should be able to proceed to the next question or screen.                                   |
| **Date**                       | [Date]                                                                                               |

#### Test Case 2: Correct Answer Selection Leads to Next Stage

| Field                         | Description                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------|
| **Test Case ID**               | TC002                                                                                                |
| **Test Case Title**            | Verify Correct Answer Selection Leads to Next Stage                                                  |
| **Test Objective**             | To ensure that when the correct answer is selected in a pop-up, the game progresses to the next question or activity. |
| **Preconditions**              | - The user has completed the first question and is presented with a choice of answers.               |
| **Test Steps**                 | 1. Select the correct answer from the provided options in the pop-up.                                |
|                               | 2. Wait for the game to transition to the next question or activity.                                  |
| **Expected Results**           | - Upon selecting the correct answer, the game should proceed to the next question or activity.       |
| **Actual Results**             | To be filled in during test execution.                                                               |
| **Pass/Fail Criteria**         | - The game must progress to the next stage after the correct answer is selected.                     |
| **Postconditions**             | - The user should be presented with a new question or a different section of the game.               |
| **Date**                       | [Date]                                                                                               |

### 4.3 Test Case Design Guidelines

To ensure consistency and quality, the following guidelines will be followed when designing test cases:

- **Clarity**: Each test case must be clear and unambiguous. The expected results should be precise, and the steps should be easy to follow.
- **Comprehensiveness**: Test cases should cover both common and edge-case scenarios. This includes testing for valid and invalid user inputs, as well as checking the game’s responses to unusual conditions.
- **Reusability**: Where possible, test cases should be designed to be reusable across different stages of testing (e.g., for regression testing or future updates).
- **Traceability**: Each test case should map directly to one or more requirements or game features to ensure full test coverage of all critical functionality.
- **Maintainability**: Test cases should be structured in a way that makes them easy to update if the game’s functionality or design changes during development.

Each tested feature is edited based on this flowchart : 

<br>
<img src="./img/Screenshot 2024-12-06 at 14.42.58.png" style="width: 500px">
<br>

### 4.4 Test Case Tool

To capture and make test cases accessible for every team member, **GitHub Issues** is a great tool. 
Based on the [test case format](#41-test-case-format), a template will be created, and used for each feature that needs to be tested

<br>
<br>

## 5. Risk Management

Effective risk management is a critical part of ensuring the success of the testing phase. This section identifies potential risks related to the testing of the **Planisphere game**, evaluates their potential impact, and outlines strategies for mitigating those risks. By identifying risks early, the team can prepare for issues that may arise during testing and ensure that the testing process remains efficient and effective.

| Risk Description | Potential Impact | Likelihood | Severity | Mitigation Strategy |
|------------------|------------------|------------|----------|---------------------|
| **Insufficient Test Coverage** | Some features or user interactions may not be tested, leading to missed defects. | Medium | High | - Create a comprehensive test plan that includes all critical features. <br> - Prioritize features based on importance and complexity. <br> - Perform regression testing to cover a wide range of interactions. |
| **Unstable Game Builds** | Frequent crashes or bugs in game builds may prevent testing from being completed or delay progress. | Medium | High | - Ensure stable game builds are provided to testers. <br> - Perform early testing on builds to identify critical issues. <br> - Implement a robust build and release management process. |
| **Inadequate Test Environment** | Test results may be inconsistent due to differences in hardware, software, or configurations. | Medium | Medium | - Ensure the test environment mirrors the production environment as closely as possible. <br> - Use virtual machines or emulators to test across multiple configurations. |
| **Lack of Time for Testing** | Limited time may lead to incomplete testing, increasing the risk of undetected bugs or issues. | High | High | - Prioritize testing based on risk (critical features first). <br> - Implement time-boxed testing cycles and focus on key functionality. |
| **Unclear Requirements** | Lack of clarity in game requirements may lead to misunderstandings, missed features, or incorrect test cases. | Medium | High | - Work closely with the development team and stakeholders to clarify requirements. <br> - Use a requirement traceability matrix to ensure all requirements are covered. |
| **Manual Testing Errors** | Human error during manual testing could lead to false negatives or positives. | Medium | Medium | - Provide testers with adequate training. <br> - Use automation where possible to reduce manual testing effort. |
| **Integration Issues** | Problems when integrating different game modules may cause delays and errors that are difficult to diagnose. | Medium | High | - Test individual modules early and independently before integrating them. <br> - Conduct integration testing frequently and fix issues as soon as they arise. |
| **Unexpected User Behavior** | Players may interact with the game in ways that were not anticipated, causing unexpected outcomes or bugs. | Medium | Medium | - Include exploratory testing to simulate various types of user interactions. <br> - Test edge cases and uncommon user actions. |
| **Defects from Previous Releases** | New updates to the game may reintroduce defects that were previously fixed. | Medium | Medium | - Perform thorough regression testing after each update. <br> - Keep track of known issues and their resolutions to prevent reoccurrence. |

## Appendix

- [Test Cases](https://github.com/algosup/2024-2025-project-2-serious-game-team-2/issues)