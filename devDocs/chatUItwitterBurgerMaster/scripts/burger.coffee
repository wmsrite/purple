# Description:
#   Find burger place
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   burger - find burger place
#
# Author:
#   williamsrite

_ = require("underscore")

burger_places = [
    {
        "name": "Almost Famous",
        "cost": "7.5",
        "rating": "4",
        "minutes": "4",
        "distance": "0.2",
        "address": "High Street",
        "postcode": "M4 1HP",
        "latitude": "53.484476",
        "longitude": "-2.236841",
        "hygiene": "3",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/493010/Almost-Famous-Burgers-Manchester"
    },
    {
        "name": "Archies Burgers and Shakes",
        "cost": "-",
        "rating": "4",
        "minutes": "20",
        "distance": "1",
        "address": "Oxford Street",
        "postcode": "M1 5NH",
        "latitude": "53.474221",
        "longitude": "-2.241047",
        "hygiene": "3",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/716122/Archie's-Burgers-%26-Shakes-Manchester"
    },
    {
        "name": "Byron",
        "cost": "6.75",
        "rating": "4",
        "minutes": "9",
        "distance": "0.5",
        "address": "Piccadilly Gardens",
        "postcode": "M1 1RG",
        "latitude": "53.480333",
        "longitude": "-2.236441",
        "hygiene": "5",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/679954/Byron-Hamburgers-Manchester"
    },
    {
        "name": "Burger and Lobster",
        "cost": "20",
        "rating": "4",
        "minutes": "10",
        "distance": "0.5",
        "address": "King Street",
        "postcode": "M2 4WU",
        "latitude": "53.480581",
        "longitude": "-2.242922",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Dog Bowl",
        "cost": "7.50",
        "rating": "4",
        "minutes": "19",
        "distance": "1",
        "address": "Whitworth Street West",
        "postcode": "M1 5WW",
        "latitude": "53.473974",
        "longitude": "-2.243336",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Dukes 92",
        "cost": "8.95",
        "rating": "4",
        "minutes": "24",
        "distance": "1.2",
        "address": "Castle Street",
        "postcode": "M3 4LZ",
        "latitude": "53.474435",
        "longitude": "-2.254759",
        "hygiene": "5",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/139932/Alberts-Shed-Dukes-Grill-Manchester"
    },
    {
        "name": "Filthy Cow",
        "cost": "6",
        "rating": "-",
        "minutes": "10",
        "distance": "0.5",
        "address": "Tib Lane",
        "postcode": "M2 4JB",
        "latitude": "53.480362",
        "longitude": "-2.244578",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Gourmet Burger Kitchen",
        "cost": "9.75",
        "rating": "3",
        "minutes": "15",
        "distance": "0.8",
        "address": "Spinningfields",
        "postcode": "M3 3ER",
        "latitude": "53.481341",
        "longitude": "-2.253384",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Handmade Burger Company",
        "cost": "6.45",
        "rating": "4",
        "minutes": "14",
        "distance": "0.7",
        "address": "Deansgate",
        "postcode": "M3 3WB",
        "latitude": "53.479201",
        "longitude": "-2.249303",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Hard Rock Cafe",
        "cost": "-",
        "rating": "4",
        "minutes": "2",
        "distance": "0.1",
        "address": "The Printworks",
        "postcode": "M4 2BS",
        "latitude": "53.485262",
        "longitude": "-2.240696",
        "hygiene": "4",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/89825/Hard-Rock-Cafe-Withy-Grove"
    },
    {
        "name": "Red's True Barebecue",
        "cost": "8.95",
        "rating": "4",
        "minutes": "12",
        "distance": "0.6",
        "address": "Lloyd Street",
        "postcode": "M2 5WA",
        "latitude": "53.478955",
        "longitude": "-2.2468",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Smoak Bar and Grill",
        "cost": "15.5",
        "rating": "3.5",
        "minutes": "7",
        "distance": "0.3",
        "address": "Malmaison Hotel",
        "postcode": "M1 1LZ",
        "latitude": "53.481876",
        "longitude": "-2.237911",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Solita Bar and Grill",
        "cost": "9.5",
        "rating": "4",
        "minutes": "5",
        "distance": "0.2",
        "address": "Northern Quarter",
        "postcode": "M4 1DN",
        "latitude": "53.483559",
        "longitude": "-2.236851",
        "hygiene": "5",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/331080/SoLiTa-Manchester"
    },
    {
        "name": "TGI Fridays",
        "cost": "10",
        "rating": "3.5",
        "minutes": "6",
        "distance": "0.3",
        "address": "Cross Street",
        "postcode": "M2 7DH",
        "latitude": "53.481676",
        "longitude": "-2.244633",
        "hygiene": "null",
        "hygiene-review": "null"
    },
    {
        "name": "Tib Street Tavern",
        "cost": "6.95",
        "rating": "4",
        "minutes": "6",
        "distance": "0.3",
        "address": "74 Tib Street",
        "postcode": "M4 1LG",
        "latitude": "53.483725",
        "longitude": "-2.234621",
        "hygiene": "3",
        "hygiene-review": "http://ratings.food.gov.uk/business/en-GB/530141/Tib-Street-Tavern-Manchester"
    }
]

shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

nearest = 'distance'
cheapest = 'cost'
best = 'rating'
cleanest = 'hygiene'
best_place = null

findAnswer = (msg, cb) ->
	user_query = msg.match[2]
	if user_query.match(/^(random|any)$/)
		random_burger_places = shuffle (burger_places)
		random_burger = random_burger_places[0]
		burger_name = random_burger.name 
		burger_cost = random_burger.cost 
		burger_address = random_burger.address
		burger_lat = random_burger.latitude
		burger_lon = random_burger.longitude 
		if random_burger.rating >= 5
			burger_rating = 'great'
		else if random_burger.rating >= 4
			burger_rating = 'good'
		else if random_burger.rating >= 3
			burger_rating = 'OK'
		else if random_burger.rating >= 2
			burger_rating = 'not bad'	
		else if random_burger.rating >= 1
			burger_rating = 'poor'		
		else
			burger_rating = 'not been rated'
		best_place = "Try #{burger_name} on #{burger_address}. It's #{burger_rating}. A burger costs £#{burger_cost}. Here's directions: https://www.google.com/maps?saddr=My+Location&daddr=#{burger_lat},#{burger_lon}"	
	else if user_query.match(/^(cheap|cheapest|value|poor)$/)
		type = cheapest
		filtered_burger = _.map(burger_places, (o) ->
		    o[type]
		)
		lowest = Math.min.apply(Math, filtered_burger.filter((x) ->
		    x > 0
		))
		lowest = lowest.toFixed 2
		lowest_burger = []
		_.filter(burger_places, (obj) ->
	    filter_type = obj[type] 
	    burger_value = parseFloat(filter_type).toFixed 2  
	    if  burger_value == lowest
	        lowest_burger.push obj
	        lowest_burger
		)
		burger_name = lowest_burger[0].name 
		burger_cost = lowest_burger[0].cost 
		burger_address = lowest_burger[0].address
		burger_address = lowest_burger[0].address
		if lowest_burger[0].rating >= 5
			burger_rating = 'great'
		else if lowest_burger[0].rating >= 4
			burger_rating = 'good'
		else if lowest_burger[0].rating >= 3
			burger_rating = 'OK'
		else if lowest_burger[0].rating >= 2
			burger_rating = 'not bad'	
		else if lowest_burger[0].rating >= 1
			burger_rating = 'poor'		
		else
			burger_rating = 'not been rated'
		best_place = "The cheapest place is #{burger_name} on #{burger_address}. It's #{burger_rating}. A burger costs £#{burger_cost}."
	else if user_query.match(/^(near|nearest|close|closest)$/)
		type = nearest	
		filtered_burger = _.map(burger_places, (o) ->
		    o[type]
		)
		lowest = Math.min.apply(Math, filtered_burger.filter((x) ->
		    x > 0
		))
		lowest = lowest.toFixed 2
		lowest_burger = []
		_.filter(burger_places, (obj) ->
	    filter_type = obj[type] 
	    burger_value = parseFloat(filter_type).toFixed 2  
	    if  burger_value == lowest
	        lowest_burger.push obj
	        lowest_burger
		)
		burger_name = lowest_burger[0].name 
		burger_cost = lowest_burger[0].cost 
		burger_address = lowest_burger[0].address
		if lowest_burger[0].rating >= 5
			burger_rating = 'great'
		else if lowest_burger[0].rating >= 4
			burger_rating = 'good'
		else if lowest_burger[0].rating >= 3
			burger_rating = 'OK'
		else if lowest_burger[0].rating >= 2
			burger_rating = 'not bad'	
		else if lowest_burger[0].rating >= 1
			burger_rating = 'poor'		
		else
			burger_rating = 'not been rated'
		best_place = "The nearest place is #{burger_name} on #{burger_address}. It's #{burger_rating}. A burger costs £#{burger_cost}."
	else if user_query.match(/^(best|finest|super|great)$/)
		type = best	
		filtered_burger = _.map(burger_places, (o) ->
		    o[type]
		)
		highest = Math.max.apply(Math, filtered_burger.filter((x) ->
  	  x > 0
		))
		highest = highest.toFixed 2
		highest_burger = []
		_.filter(burger_places, (obj) ->
	    filter_type = obj[type] 
	    burger_value = parseFloat(filter_type).toFixed 2  
	    if  burger_value == highest
	        highest_burger.push obj
	        highest_burger
		)
		random_best_burger = shuffle (highest_burger)
		burger_name = random_best_burger[0].name 
		burger_cost = random_best_burger[0].cost 
		burger_address = random_best_burger[0].address
		if random_best_burger[0].rating >= 5
			burger_rating = 'great'
		else if random_best_burger[0].rating >= 4
			burger_rating = 'good'
		else if random_best_burger[0].rating >= 3
			burger_rating = 'OK'
		else if random_best_burger[0].rating >= 2
			burger_rating = 'not bad'	
		else if random_best_burger[0].rating >= 1
			burger_rating = 'poor'		
		else
			burger_rating = 'not been rated'
		best_place = "One of the best places around here is #{burger_name} on #{burger_address}. It's rated as #{burger_rating}."	
	else if user_query.match(/^(cleanest|clean)$/)
		type = cleanest	
		filtered_burger = _.map(burger_places, (o) ->
		    o[type]
		)
		filter_burger = _.compact(burger_places)
		highest = Math.max.apply(Math, filtered_burger.filter((x) ->
  	  x > 0
		))
		highest = highest.toFixed 2
		highest_burger = []
		_.filter(burger_places, (obj) ->
	    filter_type = obj[type] 
	    burger_value = parseFloat(filter_type).toFixed 2  
	    if  burger_value == highest
	        highest_burger.push obj
	        highest_burger
		)
		random_best_burger = shuffle (highest_burger)
		burger_name = random_best_burger[0].name 
		burger_cost = random_best_burger[0].cost 
		burger_address = random_best_burger[0].address 
		burger_hygiene = random_best_burger[0].hygiene
		if burger_hygiene >= 5
			burger_hygiene = 'very good'
		else if burger_hygiene >= 4
			burger_hygiene = 'good'	
		else if burger_hygiene >= 3
			burger_hygiene = 'generally satisfactory'
		else if burger_hygiene >= 2
			burger_hygiene = 'improvement necessary'		
		else if burger_hygiene >= 1
			burger_hygiene = 'major improvement necessary'
		else 
			burger_hygiene = 'urgent improvement necessary'						
		best_place = "One of the cleanest places around here is #{burger_name} on #{burger_address}. It's rated as #{burger_hygiene}."	
	else 
		best_place = "Sorry, I didn't understand that. Please try 'burger' then 'best', 'cleanest', 'nearest', 'cheapest' or 'random'."	
	cb best_place

module.exports = (robot) ->
	robot.hear /(burger) (.*)/i, (msg) ->
		findAnswer msg, (best_place) ->
			msg.send "#{best_place}" 