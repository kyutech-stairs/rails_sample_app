# Rails Workshop 2019
## make directory for Rails app
1. mkdir <APPNAME>
2. cd <APPNAME>

## Create a new Rails app using MySQL
1. Run `bundle init` on <APPNAME> directory.
2. Remove `#` for `gem "rails"` on Gemfile.
3. `bundle install --path=vendor/bundle`
4. `bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"`
5. git add .
6. git commit -m "first commit"
7. Access GitHub.com and create repository
8. git remote add origin "https://***/<APPNAME>.git"
9. git push -u origin master
10. bundle exec rails db:create
11. bundle exec rails server
12. Access `localhost:3000`
13. Yay! You're on Rails!
14. bundle exec rails g model Tweet body:string