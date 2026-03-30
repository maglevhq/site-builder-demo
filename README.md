# Site builder demo

This minimal Ruby on Rails application runs [MaglevCMS](https://www.maglev.dev), an advanced page builder for Rails, with the **Maglev SaaS plugin** for multi-site hosting.

[Online demo](https://demo-pro.maglev.dev)

## Features

- 🌐 Once signed in, users can create as many sites as they want.
- 🎨 A new site is generated from one of the two themes included in the app.
- 🤩 Each site's content is edited with Maglev’s editor UI.
- 🔐 A TLS certificate is generated for each site with a valid domain (this requires a DNS step).
- 📦 A Kamal deployment config is included so you can deploy the app with little setup.

## Installation

You need a license key for the Maglev SaaS plugin. Visit [our site](https://www.maglev.dev/saas-edition#pricing) to get your key.

### System requirements

- Ruby 3.4+
- Rails 8.1+
- PostgreSQL / SQLite / MySQL / MariaDB
- Docker (if you want to deploy with Kamal)

### Instructions

```bash
git clone https://github.com/maglevhq/site-builder-demo
cd site-builder-demo
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
./bin/dev
```

### Kamal

We use a custom build of Kamal / [Kamal-proxy](https://github.com/basecamp/kamal-proxy/pull/63) so we can provision dynamic TLS certificates. We hope this pull request will be merged soon.
In the meantime, contact us for other options.

As an example, this is the only command we run to deploy a new version of the demo platform in production:

```bash
bundle exec kamal deploy
```

## License

The source code of this application, excluding the proprietary Maglev SaaS plugin gem, is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
