# Description:
#   Display latest news story from MEN topic page - http://www.manchestereveningnews.co.uk/all-about/manchester-central-reference-library?service=rss
#
# Dependencies:
#   "request": "2.14.x",
#   "feedparser": "0.16.x"
#		"moment": "2.8.3"
#
# Configuration:
#   None
#
# Commands:
#   latest - Gets the latest story from MEN about Manchester City Centre
#
# Author:
#   williamsrite

FeedParser = require('feedparser')
request = require('request')
moment = require('moment')

getTheArticle = (callback) ->
  feedparser = new FeedParser()

  req = request(
    url: 'http://www.manchestereveningnews.co.uk/all-about/manchester-city-centre?service=rss'

    headers:
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36'
  )

  req.on('error', (error) ->
    callback("Something bad happened with the request. #fufielding. #{error}")
  )

  req.on('response', (res) ->
    return callback("bad response code - #{res.statusCode}") unless res.statusCode == 200
    @pipe(feedparser)
  )

  feedparser.on('error', (error) ->
    callback("Feedparser error - #{error}")
  )

  feedparser.on('readable', ->
	  while item = @read()
	  	for line in item.title.split(/<br *\/>/)
        callback(line, item.link, moment(item.date, "ddd MMM DD YYYY HH:mm:ss ZZ").fromNow(true))
  )

module.exports = (robot) ->
  robot.hear /latest news|latest ?/i, (msg) ->
    gotItThanks = false
    getTheArticle (article, theLink, theDate) ->
    	theArticle = article.substring(0,48)+"[...]";
    	msg.send "I bring to you: #{theArticle} #{theLink} It’s #{theDate} old." unless gotItThanks
    	gotItThanks = true