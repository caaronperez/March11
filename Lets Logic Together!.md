# Lets Logic Together!

# Given:

* We have a url. It goes to the base level of an API
	* https://anapioficeandfire.com/api/
	* We know this url contains JSON. 
	* We also happen to know this url contains a JSON Dictionary with Keys that describe what the values are. 
		* Books: movies URL
		* Characters: characters URL
		* Houses: houses URL
* We know top level JSON will be a dictionary or an array
* We will assume that we have loaded this top level 
* We know JSON has limited types: 
	* JSON objects
		* Arrays
		* Dictionaries
	* Bools
	* Numbers
	* Strings
	* Null
* We want this to work with ANY API, not just the one we know a lot about. 

# A user clicks on a cell. What happens?

* one of four things will happen
	* It will load the next URL
	* It will load a Dictionary
	* It will load an Array
	* Do nothing if value is none of the above

* Logic:
	* Discover if type of the value is URL, Dictionary, Array
	* If it is, load it into the next view 

	
# Discover type being displayed

* Casting is a potential solution
	* if let x = whateverIsBeingDisplayedInCell as? SomeType { do something }

# Load (URL, Dictionary, Array) into next view

* Instantiate ViewController
* Give it a thing
	* If we give it an Array, what happens?
		* It displays one element of the array in each tableViewCell
	* If we give it a Dictionary, what happens?
		* It displayes one Key:Value pair in each cell
	* If we give it a URL, what happens?
		* It fetches JSON from URL
		* It discovers if the JSON is an Array or Dictionary
		* It displays the Array or Dictionary correctly

# How does a TableView work? 

* What are the necessary, minimal functions to make it work?
	* NumberOfRowsInSection
		* Optional dataSource method
			* if let arrayDataSource = arrayDataSource { return arrayDataSource.count }
			* else if let dictDataSource = dictDataSource { return dictDataSource.count }
			* else { return 0 }
		* Bool Method
			* shouldShowDictionary (name of bool)
			* if shouldShowDictionary { return dictionaryDataSource.count }
			* else { return arrayDataSource.count }
	* CellForRowAt
		* Same as number of rows, except instead of returning a count, you return a cell setup with the info from the correct datasource 
	* needs some sort of DataSource that is a CollectionType (Array, or Dictionary, in our case)
		* Since we will have 2 potential types, we probably need 2 datasource properties
	* Logic so the tableview knows what kind of datasource it is and which datasource to count
		* Bool to decide which data source to display
		* Optional data source properties so we can check for nil and only display the one with a value
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	