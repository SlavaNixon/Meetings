# Meetings/Events website

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)

## About <a name = "about"></a>
#### English
This is a [site](https://meetings-1p9o.onrender.com/) for creating meetings with friends/colleagues/relatives. It is possible to add comments, subscriptions, photos to meetings. Photos are connected to Yandex Cloud and not created locally. Action Mailer is connected, so if you lose your password, you can restore it via mail. Localization is also widely used, which allows you to add the functionality of the English language in the future.
#### Russian
Это [сайт](https://meetings-1p9o.onrender.com/) для создания встреч с друзьями/коллегами/родными. Есть возможность добавлять к встречам комментарии, подписки, фотографии. Фотографии подключены к Yandex Cloud, а не создаются локально. Подключен Action Mailer, поэтому при утере пароля его можно востановить через почту. Также повсеместно используется локализация, что позволяет добавить функционал английского языка в будущем.

## Getting Started <a name = "getting_started"></a>
The active version of the site you can try [here](https://meetings-1p9o.onrender.com/ "here").
To start using the application (run a local server) you need: Ruby on Rails 7.0.3, Ruby 3.1.1, Bundler.
#### Windows
You can get all the necessary tools by downloading [RubyInstaller](https://rubyinstaller.org/ "RubyInstaller").
#### Linux
Good instruction is [here](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm "here").

### Installing

Use `git clone` in command line being in desired directory.

```
$ git clone https://github.com/SlavaNixon/Meetings .
```

After clone start `bundle`.

```
$ bundle install
```

After use this command for database migrations
```
$ bundle exec rails db:migrate
```

Also need install yarn packages
```
$ yarn install
```

After installing gems you can start local server.

```
$ bin/dev
```
Now you can open any browser and go to `http://127.0.0.1:3000` to use service.
