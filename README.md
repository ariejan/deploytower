# DeployTower 

[![Build Status](https://travis-ci.org/ariejan/deploytower.png?branch=master)](https://travis-ci.org/ariejan/deploytower)

DeployTower is intended as a utility to support people to easily deploy apps to Heroku. The ultimate goal
is to make deployments of feature branches to different heroku apps as easy as possible for non-technical
project members (read: product owners and managers).

## Requirements

DeployTower requires a server or vps with ruby-2.1.0 and a postgresql database. It will also need access to 
your git repositories and heroku account.

Note that DeployTower will have to clone your code locally before it can push to Heroku. This means whatever
server you choose must be able to write to the local file system. At this time Heroku itself does not seem 
like a viable solution.

## Installation

DeployTower is a Ruby on Rails application. Detailed installation instructions will follow at a later time.

## Features / Wishlist

 - [ ] Manage Heroku targets
 - [ ] Manage git repositories
 - [ ] Perform deployments
 - [ ] Record deployment information (user, branch, time)
 - [ ] Before/After commands (e.g. backup restore, seeds, etc.)
 - [ ] Allow deployment of feature branches
 - [ ] Make targets lockable
 - [ ] Auto Deployments (branch following)
 - [ ] Capistrano support

## Contributing

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/ariejan/deploytower/compare/).
2. Make sure there are tests! We will not accept any patch that is not tested.
   It's a rare time when explicit tests aren't needed. If you have questions
   about writing tests for deploytower, please open a
   [GitHub issue](https://github.com/ariejan/deploytower/issues/new).

Please see `CONTRIBUTING.md` for more details on contributing and running test.

## Credits

DeployTower is currently developed and maintained by [Ariejan de Vroom](http://ariejan.net)

Thank you to all [the contributors](https://github.com/ariejan/deploytower/contributors)!

## License

DeployTower is Copyright © 2014 Ariejan de Vroom. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
