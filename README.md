# Base template for Drupal 9 projects hosted on Lagoon

This template includes everything necessary to run on [Lagoon](https://www.github.com/uselagoon/lagoon) (in both the local development environments or on hosted Lagoon clusters.)

This project template should provide a kickstart for managing your site
dependencies with [Composer](https://getcomposer.org/). It is based on the [original Drupal Composer Template](https://github.com/drupal-composer/drupal-project), 

## Included Services

This example contains the following services:
* Drupal 9.2
* PHP 8.0
* NGINX
* MariaDB 10.5

To see similar projects with additional services, please visit https://github.com/lagoon-examples and to find out more about the services, please visit the documentation at https://docs.lagoon.sh/lagoon

## Requirements

* [docker](https://docs.docker.com/install/)
* [pygmy-go](https://www.github.com/fubarhouse/pygmy-go)

**OR**

* [Lando](https://docs.lando.dev/basics/installation.html#system-requirements)

## Local environment setup - pygmy-go

1. Checkout this project repo and confirm the path is in Docker's file sharing config - https://docs.docker.com/docker-for-mac/#file-sharing

    ```bash
    git clone https://github.com/lagoon-examples/drupal9-base.git drupal9-base && cd $_
    ```

2. Make sure you don't have anything running on port 80 on the host machine (like a web server) then run `pygmy-go up`

3. Build and start the build images:

    ```bash
    docker-compose up -d
    docker-compose exec cli composer install
    ```

4. Visit the new site @ `http://drupal9-base.docker.amazee.io`

* If any steps fail, you're safe to rerun from any point.
Starting again from the beginning will just reconfirm the changes.

## Local environment setup - Lando

This repository is set up with a `.lando.yml` file, which allows you to use Lando instead of pygmy for your local development environment.

1. [Install Lando](https://docs.lando.dev/basics/installation.html#system-requirements).

2. Checkout the project repo and confirm the path is in Docker's file sharing config - https://docs.docker.com/docker-for-mac/#file-sharing

    ```bash
    git clone https://github.com/lagoon-examples/drupal9-base.git drupal9-base && cd $_
    ```

3. Make sure you have pygmy-go stopped. Run `pygmy-go stop` to be sure.

4. We already have a Lando file in this repository, so we just need to run the following command to get Lando up:

 ```bash
lando start
```

5. Install your Drupal site with Drush:

```bash
lando drush si -y
```

6. Visit the new site @ `http://drupal9-base.lndo.site`
 
7. For more information on how to configure your site, check out the [documentation](https://docs.lando.dev/config/lagoon.html).

## What does the template do?

When installing the given `composer.json` some tasks are taken care of:

* Drupal will be installed in the `web`-directory.
* Autoloader is implemented to use the generated composer autoloader in `vendor/autoload.php`,
  instead of the one provided by Drupal (`web/vendor/autoload.php`).
* Modules (packages of type `drupal-module`) will be placed in `web/modules/contrib/`
* Themes (packages of type `drupal-theme`) will be placed in `web/themes/contrib/`
* Profiles (packages of type `drupal-profile`) will be placed in `web/profiles/contrib/`
* Creates the `web/sites/default/files`-directory.
* Latest version of [Drush](https://www.drush.org/latest/) is installed locally for use at `vendor/bin/drush`.
* Latest version of [Drupal Console](http://www.drupalconsole.com) is installed locally for use at `vendor/bin/drupal`.
* The correct scaffolding for your Drupal core version is installed, along with Lagoon-specific scaffolding from [amazeeio/drupal-integrations](https://github.com/amazeeio/drupal-integrations) project and the `assets/` directory in this repo.  For more information see [drupal/core-composer-scaffold](https://github.com/drupal/core-composer-scaffold)

## Updating Drupal Core

Follow the steps below to update your core files. Scaffolding is managed by Drupal core. See the `assets/` directory for more information. 

1. Run `composer update drupal/core-recommended drupal/core-dev-pinned --with-dependencies`

## FAQ

### Should I commit the contrib modules I download?

Composer recommends **no**. They provide [argumentation against but also
workarounds if a project decides to do it anyway](https://getcomposer.org/doc/faqs/should-i-commit-the-dependencies-in-my-vendor-directory.md).

### How can I apply patches to downloaded modules?

If you need to apply patches (depending on the project being modified, a pull
request is often a better solution), you can do so with the
[composer-patches](https://github.com/cweagans/composer-patches) plugin.

To add a patch to drupal module foobar insert the patches section in the extra
section of composer.json:

```json
"extra": {
    "patches": {
        "drupal/foobar": {
            "Patch description": "URL to patch"
        }
    }
}
```

### What are the "TESTING" files in this repo?

These files are used by Github actions to run a basic suite of tests specific to this template.  They utilise the excellent [Leia](https://github.com/lando/leia) tool to generate a set of mocha-compatible tests.  Have a look through the markdown for both files, and you will see what they do. These tests can also be generated and run locally.
