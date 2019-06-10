Feature: Splash screen
    Scenario: Display a branding image on app starts
        Given I tapped the App Icon on my phone
        I should see a splash screen image
        And I should see the "Start" button

    Scenario: Initialize a new game
        When I click the "Start" button
        I should be on the "Introduction" screen

Feature: Drawer menu
    Scenario: Toggling menu drawer button
        Given I am on the "Introduction" screen
        When I click the "menu" button
        I should see the menu drawer with items open
        Then I click on the "menu" button
        The menu drawer should be closed

Feature: Game section layout
    Scenario: Displaying page elements
        When I am on a game section (section 1|2|3)
        I should see the section indicator on the top of the screen
        And I should see team name and team score at the bottom of the screen

        When I am click a game section on the menu
        I should see the game rule screen and the "Start" button
        Then I click the "Start" button
        And I should see each card with corresponding score

Feature: Card question interactions
    Scenario: Displaying card question
        Given I am on a game section
        When I click on a card
        I should see a modal screen
        And I should see the question and a timer
        And I should see the score for the card

    Scenario: Displaying answer
        Given the card question is open
        Then I tap the card
        I should see the card flip and display the answer

    Scenario: Closing the question
        Given the card question is open
        Then I swipe the card
        I should be see the game section screen
        And the card status should be updated
        And the card should turn gray

    Scenario: Question timeout
        Given the card question is open
        When there are 5 seconds remain
        I should hear a warning beat for each of the remaining second

Feature: Updating score
    Scenario: Update score via card
        Given the card question is open
        When I tap a corner of the card (TL: team A +; BL: team A -; TR: team B +; BR: team B -)
        I should see score update

    Scenario: Update score via Team card button
        When I tap the team card
        I should see an indicator for the active team selected
        And I should see an input box with current team score
        Then I update the score
        And I click the update button
        I should see the updated score for the team
