# How to make Manchester Evening News part of the fabric of the city.
Exploring what lies between the physical newspaper and the digital web/app. What are the physical manifestations of news in a city? The project targets the *mobile* audience and the *local* audience.  

### Commands 
* 'rain' - tells you if it's going to rain in the next hour
* 'latest' - gets the latest local story from MEN
* 'popular' - gets the hottest social story from greater Manchester from MEN
* 'burger' - recommends a burger place nearby
* 'vote' - shows a candidate standing in the general election
* 'safe' - gets the crime rate cf nearby crime rates
* 'random crime' - shows a local crime and its outcome from crime stats for December 2014
* 'talk' - a question and answer. Needs 'answer' in user answer to continue the conversation

### Running chatbot-twitter Locally

You can test your hubot by running the following.

You can start chatbot-twitter locally by running:

    % bin/hubot


### Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started, along with the [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

For many common tasks, there's a good chance someone has already one to do just
the thing.

### hubot-scripts

There will inevitably be functionality that everyone will want. Instead
of writing it yourself, you can check
[hubot-scripts][hubot-scripts] for existing scripts.

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

### external-scripts

Hubot is able to load scripts from third-party `npm` package. Check the package's documentation, but in general it is:

1. Add the packages as dependencies into your `package.json`
2. `npm install` to make sure those packages are installed
3. Add the package name to `external-scripts.json` as a double quoted string

You can review `external-scripts.json` to see what is included by default.


## Twitter adapter
https://www.npmjs.com/package/hubot-twitter

## Restart the bot

You may want to get comfortable with `heroku logs` and `heroku restart`
if you're having issues.
