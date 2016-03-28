# Discourse VK.com Plugin

VK.com login for Discourse

## Installation

### the official Docker

To install in docker, add the following to your app.yml in the plugins section:

```
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/discourse/docker_manager.git
          - git https://github.com/stereobooster/discourse-vk-login.git
          - cp discourse-vk-login/db/migrate/* db/migrate/
```

and rebuild docker via

```
cd /var/discourse
./launcher rebuild app
```

### Stand-alone

Just two easy steps. From your main discourse do:

    cd plugins
    git clone https://github.com/stereobooster/discourse-vk-login.git
    cd ..
    export RAILS_ENV=production                    # set to productions
    cp discourse-vk-login/db/migrate/* db/migrate/ # copy migrations
    rake db:migrate                                # run migrations
    rake assets:precompile                         # precompile assets

## Changelog:

## TODO

## License

MIT
