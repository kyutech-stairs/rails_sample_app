# Rails Workshop 2019
## Make a new directory for Rails app.
```
mkdir rails_sample_app
cd rails_sample_app
```

## Create a new Rails app using MySQL.
1. Make Gemfile on APPNAME directory:
```
bundle init
```
2. Remove `#` for `gem "rails"` on Gemfile:
```
# gem 'rails'
```
↓
```
gem 'rails'
```

3. Install Rails: 
```
bundle install --path=vendor/bundle
```

4. Set build-flags for Installing `gem 'mysql2'`:
```
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
```

5. Create a new Rails app using MySQL:
```
bundle exec rails new . --database=mysql
```

## Let's use git and GitHub !
1. Add to index for all changed files on a repository:
```
git add .
```
*"repository" is a space which manages states of project data.*

2. Commit with an massage:
```
git commit -m "first commit"
```

3. Access GitHub.com and create an repository.
```
USERNAME/rails_sample_app
```

4. Connect a local repository and a remote repository:
```
git remote add origin https://github.com/USERNAME/rails_sample_app.git
```
- "local" is managed by your computer
- "remote" is managed by an Web service like GitHub.

5. Push a local's commits to  a remote:
```
git push -u origin master
```
6. Checkout `develop` branch from `master`:
```
git checkout -b develop
```

7. Push `develop` to `origin develop`:
```
git push origin develop
```

||Local|Remote|
|:-:|:-:|:-:|
|repository|rails_sample_app|github.com/*/rails_sample_app|
| default branch | master | origin master |
|current branch| develop | origin develop |


## Create databases and check your app on localhost server.

1. Create new databases:
```
bundle exec rails db:create
```

2. Launch local server by puma:
```
bundle exec rails server
```
3. Go to `http://localhost:3000` to check your app.

4. Yay! You're on Rails!

5. `git add & commit`

## Create "Tweet" model

1. Design Tweet model's table

| columnns | type | memo|
| -: | :- | :- |
| id | integer | auto created by rails |
| **body** | **string** | **max-length: 120, null: false** |
| created_at | timestamp | auto created by rails |
| updated_at | timestamp | auto created by rails |

2. Generate Tweet model and migration file:
```
bundle exec rails generate model Tweet body:string
```

3. Migrate Tweet table to database:
```
bundle exec rails db:migrate
```

4. `git add & commit`

## Generate and Setup `tweets_controller`

1. Design `tweets_controller`

| Action | Behavior |
| -: | :- |
| index | get all tweets |
| show | get a tweet |
| new | create a new tweet |
| create | post a new tweet to model |
| edit | get a tweet for edit |
| update | post a edited tweet to model |
| destroy | destroy a tweet |

2. Generate `tweets_controller`
```
bundle exec rails g controller tweets
```

3. `git add & commit`

4. Edit `app/controllers/tweets_controller`