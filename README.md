David, Hubot is a project made in collaboration with the city of Manchester Evening News. It is a way for inanimate objects around the city to interact with the locals. We started with SMS, but not having the funding to use Twilio we opted to go with Twitter. But, the same engine can be used with SMS, WhatsApp or Facebook. By we I mean a mate of mine with whom I built an entire online news site in Abu Dhabi: Rob Carroll. He and I frequently work together, my side is usually the coding and his is the UIX.

I realize this is a long explanation, so I'm happy to give you the TL;DR version if you want. It shares a lot of what Purple.io does. We still have quite a few kinks to work out, and maybe that's something you would be interested in helping with. Or, better yet, just bring this project under the purple umbrella and have it be a co-enterprise.

part 1

The last couple of years have seen some great projects exploring different uses of technology and the city. Hello Lamp Post, which took place in Bristol during the summer of 2013, was particularly exciting. In case you haven’t seen it, here’s the idea: people send a text message to an object around the city such as a lamppost or postbox and then become part of a conversation with other people who have done the same. The main point here is that the city’s inanimate infrastructure becomes the conduit to layers of information, stories and other people without those objects actually being connected to the network.

We were keen to explore this idea in the context of news and information. Imagine if you could build up detailed maps and information about demographics, crime, housing and schools (all from public sources) as well as timely information such as what’s on and what’s happened and then people could interact with this wealth of information about specific locations through the city’s infrastructure in playful and engaging ways. Add to this elements such as sensors, e.g. Smart Citizen project with FutureEverything, and there are some very rich and exciting things to explore – air composition (CO and NO2), temperature, light intensity, sound levels, and humidity. That was the pitch. The Manchester Evening News were also keen on the idea – in particular, how it could be used to help a news organisation to become part of the fabric of the city.

TRADITIONAL APPROACHES
There’s some existing approaches to providing these kind of services and information.

Mobile app – User must download it. Limits audience. Keeps the experience with the screen.
Information kiosks / touch screens – Expensive and proven to be under-utilised.
MAKING INANIMATE OBJECTS SOCIAL AND CONNECTED
If we give the illusion of a connected object using existing city infrastructure and build a conversational user interface which anyone with a phone could engage with, we could in theory avoid the problems of the traditional approaches.

These objects are rooted in a particular location, so we can provide neighbourhood-specific content without any geolocation wrangling. Everybody has SMS, so there’s no friction, such as go to the App store and download this app – before a user can even begin. The framing premise is also convincing: these object sit in the city and are witnesses to the changing face of the city, its history and the activities taking place there. In the end we came up with a range of possible activities.

Possible opportunities for interaction

Neighbourhood news – Specific news and information for a particular area
News archives – Historical news and images revealing the city’s history
Service discovery – What’s around me? What can I do? eg cinema listings, restaurants, etc
Ambient and other data – traffic, crime, sensors data such as noise and air quality
Civic expression – relationships between citizens and their city
PROJECT AIMS
So we decided to build some prototypes to explore:

Will users interact in this way? Design of conversation user interfaces and social objects and reactions to them
Is it useful? Are these encounters different or better than simply using a website or app?
Is it an effective gateway to MEN content? Does MEN have the right kind of news of information for this approach?
This post is part of a series about a project exploring conversational UIs for news and information to help Manchester Evening News become part of the fabric of the city.

part 2

Hubot is a “customisable, life-embetterment robot” created by Github. They wrote it to automate a range of activities in their company chat room. It’s open source, written in CoffeeScript on Node.js, can be deployed on Heroku and has lots of external scripts written by users. For all these reasons, we decided to use Hubot as the basis for our project.

It didn’t take long to get Hubot up and running with the Campfire. The first version responded to a few simple commands. It pulled in the latest news from the MEN’s RSS feed, sent a random old image from The Manchester Local Image Collection at the Central library and got the local weather.

We chose the Central Library as an exemplar because it was a recognisable building in the city centre and the MEN had a topic page for it.

We spent a while scraping the articles from the MEN topic page and doing various simple things such as the word count, the latest article and the oldest article. We ended up with something like this:

MEN has written 15,626 words about me in the last 7 months and a human would take about 63 minutes to read them. That’s like reading The Communist Manifesto (11,772 words) which Marx and Engels worked on at the nearby Chetham’s library in the 1840s. The latest article was 2 days ago. The oldest article was 7 months ago.
The idea was to connect the current information to interesting things in the city’s history. It didn’t quite work for a variety of reasons including the fact that Manchester apparently has an oral rather literary tradition making it trickier to find a range of books to reference. An interesting diversion nevertheless.

MOVING TO SMS
In sprint 2 we changed the adapter from Campfire to Twilio, so someone could interact with the system using SMS.

Local news worked well. The interaction felt natural and useful, providing value beyond any existing service and sitting conceptually somewhere between the web and a newspaper. It surfaces neighbourhood articles which might be lost in other mediums, e.g. web, Twitter which focus on latest.

News via SMS

Weather was OK, but it felt a bit pointless. It needed to be more useful, unique and specific. Other apps do the weather better. We wondered if perhaps a specific question would work, e.g. is it going to rain in the next hour?

Weather via SMS

A bit of personality worked well such as knowing the time of day and the weather and responding accordingly, but having menus inside the application did not work and felt a bit confusing and wasteful.

Personality and options

TENTATIVE FINDINGS
Lots of things came out of this work. It’s become quite common now, but thinking through making really is important in this type of project. We discovered practical issues such as no picture messages (Twilio MMS is US/Canada only), the potential cost to the user (could feel like “feeding a metre” for users without text-inclusive plans) and the cost to MEN (at $0.04 to send and $0.0075 to receive an SMS is the interact valuable enough?). We also got used to some of the affordances and qualities of SMS as a material. People don’t usually sit and wait for a reply with a text message. They text and receive texts on the move meaning the initial premise of standing in front of an object could be going against the grain. We also discovered that general information, such as the Central library guided tour, is not useful or compelling enough to work in this context.

MATERIAL AFFORDANCES
A quick chat with Tom Armitage, who worked on Hello Lamppost, helped to clarify some of the important conclusions to be drawn here.

SMS tends to be an intimate space usually reserved for messages from friends. Though companies and services are encroaching, it is still a private space with particular opportunities and issues.
There’s no room for extended, light conversations because it is too expensive and maintaining attention could quickly become a problem. Each message must be useful, dense and meaty.
No room for menus or instructions inside the application. We have to make the first text count by making the user choose options in initial text and move the prompts with instructions outside the application.
The conversation is probably going to follow a shape like this:

The shape of a conversation

This shape also led us to explore what to do with the secondary interaction. Could we gather information from user? Could the user customise the service by responding to the first SMS with those preferences remembered so that the service improves over time, a bit like – as Tom pointed out – the homotropic newspaper-vending robot in Philip K Dick’s novel The Game-Players of Titan?

In the end, the focus came down to being useful. Sprint 3 would focus on user needs with a playful personality. The system could become a convenient way to access the many APIs and data about the city. We would explore the usual suspects such as neighbourhood news, weather, travel delays and departures and open data such as neighbourhood statistics and census information as well as whether it was a good way to gather information from users.

We also decided to move from SMS to Twitter to avoid the question of cost to the user and the MEN.

This post is part of a series about a project exploring conversational UIs for news and information to help Manchester Evening News become part of the fabric of the city.


part 3

After exploring the possibilities of SMS, we moved to Twitter for the next stage of the project. This decision was mainly driven by cost: MEN would have to pay for Twilio (the service which powers the SMS functionality) and it would be difficult to recoup that money or justify spending it in the first place.

As it turned out, Twitter was an excellent medium for this kind of interaction. The character count enforced focus, while the idea of an inanimate object in the city sending a Twitter post somehow seemed more convincing than an SMS. The activity was embedded in an object in the city which spoke in the first person, expressed itself through Twitter and even had a glimmer of personality.

The focus of this sprint was being useful, which involved answering as many possible questions as possible and then testing them with users to see which ones they actually did find useful.

IS IT GOING TO RAIN?
We started off with the weather. Rather than churning out a general weather forecast we decided to try to answer the question, “Is it going to rain in the next hour?” We took the detailed forecast from forecast.io, examined the probability and intensity of rain in the next hour and used it to answer the question. It worked quite well:

Is it going to rain?

WHAT’S THE NEWS AROUND HERE?
The news also worked well on Twitter thanks to the cards display.

What’s the latest news?

The medium exposed problems in the content itself: it wasn’t specific enough or regular enough to power this system satisfactorily. The MEN is taking on a city centre blogger, so there will be more relevant content in the future, but the conversational UI does enforce the idea of specifically answering user needs – it’s a question / answer format after all. For this to work well, the content would need to be structured around specific locations and taxonomies. If it was tagged by things like type or mood, we could start to experiment with allowing the user to customise the service by replying to the Twitter post, which opens up all sorts of interesting possibilities.

WHAT’S THE MOST POPULAR NEWS AROUND HERE?
We used the Chartbeat API to get the local article which is being shared the most on Facebook, Twitter, etc. It worked quite well, although the wording “hottest” story needs to be changed to accommodate all possible stories.

What’s the most popular story?

CRIME STATISTICS
The API at http://data.police.uk has lots of information about specific crimes as well as more general statistics. One option is to show specific crimes at a particular location along with their outcomes. We combined the details such as location, type of crime and the outcome for a single incident into a sentence. Tweet “random crime” and the postbox will reply with one of thousands of crimes from December 2014 that actually happened nearby.

Random crime

Each tweet gives you a sense of what crime incidents happen in the area as well as their outcome. We felt the randomness reflects – in limited ways – the nature of crime itself. I urge you to try it for yourself.

The general statistics didn’t work quite so well. The idea was that by comparing statistics such the crime rate and total crimes to neighbouring areas you would get a sense of how safe a place was. The city centre’s small population gave it a crime rate of 84.43 and using the total crimes wasn’t easy to convey in a single tweet. There’s still lots to explore with this data.

Is it safe?

ELECTION
The general election was coming up as we were working on this sprint so we decided to try incorporating information about the candidates from YourNextMP. It would have been good to find out more about the candidate for a particular party, but the fragility and weakness of the conversational UI emerged since it’s difficult to inform a user about all the different parties in a single tweet. So we settled for random, giving users a broad sense of which candidates were standing and perhaps exposing people to less-well-known candidates.

Who can I vote for?

It was also difficult to convey the distinction between this is who you should vote for and this is who you could vote for, since the tweet was not a recommendation.

INFORMATION GATHERING
Having an extended conversation was always going to be tricky, but we tried it as a way of gathering interesting subjective information from people about their neighbourhood. We asked questions about the neighbourhood and showed someone else’s answer along with the next question.

Let’s talk

There were all sorts of problems here including needing to type “answer” to keep the conversation going, problems around the possibility of rude words from mischievous users and the general clunkiness, but it might be worth exploring in different ways in the future.

SERVICE DISCOVERY
The final conversation used information about burger restaurants from an MEN article to provide recommendations of a place to eat. At the moment, the suggestion is random:

Service Discovery

You get details about the rating – poor, not bad, OK, good and great – as well as the cost of a burger and directions from the postbox. This service was the most popular by far as well as the easiest for people to understand, so we are going to work on improving it in the next sprint.

CONCLUSIONS
It was a great sprint exploring a range of different directions with good reaction from users in general to the concept. Here’s some of the things we learnt:

The conversational UI feels useful and provides something different to other ways of interacting with MEN.
The conversational UI is flexible and transferable – SMS, Twitter, WhatsApp, etc may have different affordances – but creating content in a general conversational format means the engine could be used to run different outlets without too much extra effort.
The conversational UI creates an interesting interface on top of various city APIs which would otherwise be difficult to access. Lots of editorial and data work could be done to create useful and interesting information which answers a specific need, e.g. rain, crime. Other possible sources include school data, census data, transport information and sensor data.
The first person framing could be a good place to explore presenting stories by emotion, e.g. awe-inspiring, emotional, positive and surprising.
There are interesting possibilities for gathering information by mixing automated replies along with routing to a human elsewhere.
WHAT NEXT?
Service discovery was by far the most popular function with users. They immediately grasped the idea and thought it was useful. So we are going to create a new Twitter account for the Piccadilly Wall in the city centre and use it to find nearby burger restaurants. People will be able to filter the information, eg cheapest, best, nearest, random, cleanest using the command first followed by modifier, ie ‘burger cheapest’.

We are also going to explore the commercial possibilities. What if a person had to retweet the recommendation to get a discount? The place would get publicity to the person’s followers and it would be unrepeatable, i.e. you need the retweet on your timeline to get the discount.

There were also some technical issues around JSON parsing errors, repeated tweets and character counts which we hope to work on to improve the experience.

It’s been great to work on this project which is not over yet. Thanks to the Manchester Evening News for the opportunity. If “designing for messaging” does “become a discipline as important as responsive design”, we hope to be at the forefront of these developments, blending writing and programming to create new experiences for 21st-century journalism.

This post is part of a series about a project exploring conversational UIs for news and information to help Manchester Evening News become part of the fabric of the city.

