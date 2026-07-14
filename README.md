# Booth Finder

Booth Finder is a Rails web app being built to help New Zealand voters find their voting places for the 2026 general election.

## How the app will work

Once complete, the app will allow a user to search for voting places by suburb, postcode, city, or electorate. The system will return a list of relevant polling places with details such as:

- the booth or venue name
- the full address
- the suburb and city
- the electorate
- venue type and accessibility information
- any notes or opening hours that are available

The goal is to make it easier for voters to find the right place to vote quickly and confidently, especially during a busy election period.

## New Zealand election context

This app is intended for the New Zealand general election in 2026. In that context, it is designed to support a simple public-facing use case:

1. A voter enters a location such as a suburb or postcode.
2. The app searches the database for matching voting places.
3. The relevant booths are displayed in a clear list.
4. The voter can use that information to identify where they should go on election day.

## App structure

The app is built around two core data types:

- Suburbs: used to group voting places by local area
- Voting places: individual polling locations linked to a suburb

This structure supports fast location-based searches and keeps election venue information organised in one place.

## Planned user experience

A typical flow will be:

1. A user opens the app and enters a location such as a suburb or postcode.
2. The app searches for matching voting places.
3. The results are shown in a simple list with enough detail to help the voter identify the correct booth.
4. The app can later be expanded with maps, filters, and more advanced election information.

## Current status

The project already includes the core database structure for suburbs and voting places. The next step is to add the public-facing search and display experience for election use.
