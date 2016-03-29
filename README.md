# Discourse VK.com Plugin

VK.com login for Discourse

**Caution**: there are no tests, use at your own risk!

## Installation

### the official Docker

To install in docker, add the following to your app.yml in the plugins section:

```yaml
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

Set `vk_client_id` and `vk_client_secret` settings in the users section.

### Stand-alone

Just two easy steps. From your main discourse do:

```
cd plugins
git clone https://github.com/stereobooster/discourse-vk-login.git
cd ..
export RAILS_ENV=production                    # set to productions
cp discourse-vk-login/db/migrate/* db/migrate/ # copy migrations
rake db:migrate                                # run migrations
rake assets:precompile                         # precompile assets
```

## TODO

  - Do not show button if there are no VK API keys
  - Add tests

## License

MIT

## Development

Examples of code:

  - https://meta.discourse.org/t/beginners-guide-to-creating-discourse-plugins/30515
  - https://github.com/auth0/discourse-plugin/blob/master/plugin.rb
  - https://github.com/werweisswas/discourse-plugin-tagger/blob/master/plugin.rb
