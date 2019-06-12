# Rails Workshop 2019

1. `bundle init`
2. Remove comment-out for `gem "rails"` on Gemfile
3. `bundle install --path=vendor/bundle`
4. `bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"`
5. git add .
6. git commit -m "first commit"
7. Access GitHub.com and create repository
8. git remote add origin ***.git
9. git push -u origin master
10. Reload GitHub
11. bundle exec rails db:create
12. bundle exec rails server
13. Access `localhost:3000`
14. Yay! You're on Rails!
15. bundle exec rails g model Tweet body:string