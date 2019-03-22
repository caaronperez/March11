# 2^nd Week Test - JSON, TableViews, DetailView, Constraints

## Requirements

* 2 UIViewControllers
	* 1 will have a tableview (This is where the app will go when its open)
	* 1 detail view 
* Parse the JSON
	* JSON is from <a href="https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes">```https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes```</a>
	* This has the episodes from Game of Thrones in JSON format
* Tableview
	* each cell should display:
		* season (unless its in sections with a section for each season, and the sections are correctly labled)
		* episode number
		* episode name
* When a User clicks on a cell in the tableview, it takes them to the detail view, which will display more information. 
* Detail View 
	* should display:
		* episode title 
		* Premier date
		* Airtime
		* Season
		* episode number
		* summary
	* Each displayed attribute should be labled
	* Should be able to navigate back to the tableview
* Load the JSON from a file saved in your project
* Everything must be constrained correctly. No warnings in your storyboard for constraints.

# Bonus

* Add a search bar to filter your tableview
* Display images in the tableview
* Display image in the Detail View
* In the tableview, only have one season per section and section headers should have 
* use a custom implementation of codable (coding keys and custom property names)
* Code should follow our <a href="https://github.com/JeremiahHawksMCS/Notes/blob/master/StyleGuide.md">code style guide</a>


# Fred and Eduardo

* You two must also build out the network call and fetch the json from the url, no third party libraries
* I think you two shoudl be able to do this without the bonuses in 2 hours. Try to stay under that time limit.
* You two must also follow the <a href="https://github.com/JeremiahHawksMCS/Notes/blob/master/StyleGuide.md">code style guide</a>
* use a custom implementation of codable (coding keys and custom property names)
