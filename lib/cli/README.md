# faker (cli)

## Usage

1.) Run a quick lookup

```bash
$ faker search name
# Faker::SwordArtOnline
# └── real_name
# └── game_name
# Faker::Superhero
# └── name
# ....
```

2.) List methods

```sh
$ faker list
# Faker::BackToTheFuture
# ├── quote
# ├── date
# └── character
# Faker::Finance
# └── credit_card
# ....
```

`faker` also includes an option to display sample output via the `--verbose` or `-v` flag. :wink:

3.)

```sh
$ faker list -v
# Faker::Appliance
# ├── brand=> Whirlpool
# └── equipment=> Sump pump
# Faker::UmphreysMcgee
# └── song=> Headphones & Snowcones
$ faker search name -v
# Faker::App
# └── name=> Subin
# Faker::Address
# └── street_name=> Percy Landing
# ....
```

## Features! :sunglasses: :dancers:

- [x] List classes with methods E.g. Faker::FunnyName is displayed with `.name`,`.first_name` e.t.c.
- [x] Expand search to Faker::Base sub classes
- [x] Paginate results :book:

![screenshot 2019-01-05 at 03 02 08](https://user-images.githubusercontent.com/17295175/50717135-59d85780-1096-11e9-8d0d-eca95646644d.jpg)
