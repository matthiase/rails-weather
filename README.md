# README

This README documents the steps are necessary to get the application up
and running.

### Install Ruby, NodeJS and Yarn
Use your preferred method of installing Ruby 3.2.2, NodeJS 20.9.0 and Yarn on
your system - for example:
```
rbenv install 3.2.2
nvm install 20.9.0
brew install yarn
```

### Set up the development environment
Clone the repository and change your working directory
```
git clone git@github.com:matthiase/rails-weather.git
cd rails-weather
```

If you are using a version manager, the correct Ruby and NodeJS versions should be used automatically. However, you may want to make sure.
```
ruby -v
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-darwin21]
```

```
node -v
v20.9.0
```

Create the master key file in order to read secrets from the credentials file
```
echo YOUR_MASTER_KEY > config/master.key
```

Turn on caching during development
```
bin/rails dev:cache
```
Note that this command toggles the cache on and off in development mode. To disable caching, simply run it again.

### Build and run the application
Install dependencies
```
bundle && yarn
```

Build the assets
```
yarn build && yarn build:css
```

Start the development server
```
bin/rails server
```