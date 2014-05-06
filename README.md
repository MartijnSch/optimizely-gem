Optimizely
===========

The unofficial (basic) Ruby gem to communicate with the Optimizely Experiment API (http://developers.optimizely.com/rest/).
The Experiment API lets you create and manage Optimizely projects and the experiments inside of them.

To start using the Optimizely Experiment API you need an API Token, you can request one via: developers@optimizely.com

# Quick start

## Installation

Add Optimizely to your Gemfile

    gem 'optimizely'

Don't forget to bundle install:

    $ bundle install

# General usage

### Create your Optimizely object

    optimizely = Optimizely.new({ api_token: 'abcdefghijklmnopqrstuvwxyz:123456' })

## Projects

	Retrieve all projects:
		projects = optimizely.projects

	Retrieve a specific project:
		project = optimizely.project(12345)

## Experiments
	
	Retrieve all experiments for a project:
		experiments = optimizely.experiments(12345)

	Retrieve a specific experiment:
		experiment = optimizely.experiment(12345)

## Variations

	Retrieve all variations for an experiment:
		variations = optimizely.variations(12345)

	Retrieve a specific variation:
		variation = optimizely.variation(12345)

## Audiences

	Retrieve all audiences for an project:
		audiences = optimizely.audiences(12345)

	Retrieve a specific audience:
		audience = optimizely.audience(12345)

# Information

### Changelog

#### 1.1.1
* Return a hash object for the data you've just requested.

#### 1.1
* Fix some typos in the errors for having no variable in a function and added extra documentation.
* Add support for reading specific projects, experiments, variations and audiences.

#### 1.0
* Add all basic features for the Optimizely Experiment API for listing projects, experiments, variations and audiences.

### Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as
possible to help us fixing the possible bug. We also encourage you to help even more by forking and
sending us a pull request.

https://github.com/martijnsch/optimizely-gem/issues

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request