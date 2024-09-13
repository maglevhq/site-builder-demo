# Site builder demo

This very minimal and simple Ruby on Rails application runs the **PRO version** of [MaglevCMS](https://www.maglev.dev), the most advanced page builder gem in Rails.

[online demo](https://demo-pro.maglev.dev)

## Features

- 🌐 once signed up/in, users can create as many sites as they want.
- 🎨 a new site is generated from one of the 2 themes included in the app.
- 🤩 the content of each site is edited thanks to the awesome UI/UX of Maglev.
- 🔐 a TLS certificate is generated for each site with a valid domain (require a DNS operation).
- 📦 a Kamal deployment config file is provided, making the deployment of this application really easy.

## Installation

The installation requires a license key of the Maglev PRO version. Visit [our site](https://www.maglev.dev/pricing) to get your key.

### System requirements

- Ruby 3.2+
- Rails 7.1+
- Postgresql
- Docker (if you want to deploy it with Kamal)

### Instructions

```code
git clone https://github.com/maglevhq/site-builder-demo
cd site-builder-demo
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
./bin/dev
```

### Kamal

On the server

```
docker network create --driver bridge private
```

```
mkdir -p /var/local/data/storage
chown 1000:1000 /var/local/data/storage
```

## License

The source code of this application without the Maglev PRO gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


