SoccerBet
=========

SoccerBet is a complete open-source Rails application to run bets or pools for soccer tournaments with friends. At this time, this app only uses Facebook login and all user-management is Facebook-based. So, you need a Facebook API key, get it on [Facebook Developer](http://developer.facebook.com).

**Rules of the game**

This game give points to the users when they correctly predicting the result:

* 1 point: When the user predict the game's result (winner, draw or looser).
* 3 points: When the user predict the game's exact result (number of goals).

The leaderboard automatically updates when the administrator captures the game's result.

## Installation

### Requirements

* Ruby >= 2.0.0
* Up and running instance of [Redis](http://redis.io/). The leaderboard is Redis-based.

### Cloning and running

Get the latest version of the app:
```console
git clone https://github.com/edulomeli/soccerbet.git
```
Install all the dependencies:
```console
bundle install
```
Run database migrations:
```console
rake db:migrate
```
Set Facebook API keys as env variables (use the method you like, I use Foreman):
```console
FB_PRIVATE_KEY=XXX
FB_PUBLIC_KEY=XXX
```
Set Redis URL as env variable:
```console
REDIS_LOCAL_URL=redis://localhost:6379
```
Run the server:
```console
rails s
```

### Deploy to Heroku

This process will install SoccerBet on Heroku using all free plans available.

```console
heroku apps:create soccerbet-demo
git push heroku master
heroku run rake db:migrate
```
For Redis I use RedisCloud provider, but you can choose any other you like (take a look to `initializers/redis.rb`:

```console
heroku addons:add rediscloud:25
```
Set Facebook API keys as env variables:

```console
heroku config:set FB_PRIVATE_KEY=XXX
heroku config:set FB_PUBLIC_KEY=XXX
```
Optionally, this app is prepared to run New Relic, so you only need to install the add-on:
```console
heroku addons:add newrelic:stark
heroku config:set NEW_RELIC_APP_NAME="YOUR APP NAME GOES HERE"
```

## Locales and I18n
This first version is available completely in Spanish, English will be added very soon. All the app messages are in the standard `config/locales` directory.

## World Cup 2014
If you want to run a Pool for World Cup 2014, you can find all the teams and games of the tournament in `db/seeds/` in CSV. To install it run `rake db:seed`. All the times are UTC.


## Contributing
I hope that you will consider contributing to SoccerBet.
