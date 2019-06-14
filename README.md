# Rails Workshop 2019 Day 1
## Make a new directory for Rails app.
```bash
mkdir rails_sample_app
cd rails_sample_app
```

## Create a new Rails app using MySQL.
1. Make Gemfile on APPNAME directory:
```bash
bundle init
```
2. Remove `#` for `gem "rails"` on Gemfile:
```Gemfile
# gem 'rails'
```
↓
```Gemfile
gem 'rails'
```

3. Install Rails: 
```bash
bundle install --path=vendor/bundle
```

4. Set build-flags for Installing `gem 'mysql2'`:
```bash
bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
```

5. Create a new Rails app using MySQL:
```bash
bundle exec rails new . --database=mysql
```

## Let's use git and GitHub !
1. Add to index for all changed files on a repository:
```bash
git add .
```
*"repository" is a space which manages states of project data.*

2. Commit with an massage:
```bash
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
```bash
git push -u origin master
```
6. Checkout `develop` branch from `master`:
```bash
git checkout -b develop
```

7. Push `develop` to `origin develop`:
```bash
git push origin develop
```

||Local|Remote|
|:-:|:-:|:-:|
|repository|rails_sample_app|github.com/*/rails_sample_app|
| default branch | master | origin master |
|current branch| develop | origin develop |


## Create databases and check your app on localhost server.

1. Create new databases:
```bash
bundle exec rails db:create
```

2. Launch local server by puma:
```bash
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
```bash
bundle exec rails generate model Tweet body:string
```

3. Migrate Tweet table to database:
```bash
bundle exec rails db:migrate
```

4. `git add & commit`

## Generate `tweets_controller`

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

2. Generate `tweets_controller`:
```bash
bundle exec rails g controller tweets
```

3. `git add & commit`

## Edit `tweets_controller` Part 1
1. Open `app/controllers/tweets_controller.rb`:
```ruby
class TweetsController < ApplicationController
end
```

2. Define `index` method:
```ruby
class TweetsController < ApplicationController
  # --- start ---
  def index
    @tweets = Tweet.all
  end
  # --- end ---
end
```

- `git add & commit`

3. Define `show` method:
```ruby
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  # --- start ---
  def show
    @tweet = Tweet.find_by(id: params[:id])
  end
  # --- end ---
end
```

- `git add & commit`

4. Define `new` method:
```ruby
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  # --- start ---
  def new 
    @tweet = Tweet.new
  end
  # --- end ---
end
```

-  `git add & commit`

5. Define Strong Parameters on private:
```ruby
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new 
    @tweet = Tweet.new
  end

  # --- start ---
  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
  # --- end ---
end
```

6. Define `create` method:
```ruby
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new 
    @tweet = Tweet.new
  end

  # --- start ---
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end
  # --- end ---

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
```

- `git add & commit`

## Set routing
1. Open `app/config/routes.rb`:
```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```

2. Set routing for tweets_controller:
```ruby
# How to write routing
root 'controller#action'
get '/path', to: 'controller#action'
post '/path', to: 'controller#action'
resources :controller
# etc ...
```

- resources:
```ruby
resources :tweets
```
**↑ Same routing ↓**
```ruby
get '/tweets', to: 'tweets#index'
get '/tweets/:id', to: 'tweets#show'
get '/tweets/new', to: 'tweets#new'
post '/tweets', to: 'tweets#create'
get '/tweets/:id/edit', to: 'tweets#edit'
patch '/tweets/:id', to: 'tweets#update'
delete '/tweets/:id', to: 'tweets#destroy'
```
- this time:
```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tweets', to: 'tweets#index'
  get '/tweets/new', to: 'tweets#new'
  get '/tweets/:id', to: 'tweets#show'
  
  post '/tweets', to: 'tweets#create'

end
```

3. Check routing: 
```bash
bundle exec rails routes
``` 
- `git add & commit`

## Create and Edit View files Part 1
1. create new files in `app/views/tweets`
```
app/
    assets/
    channels/
    controllers/
    helpers/
    jobs/
    mailers/
    models/
  * views/
        layouts/
      * tweets/
            index.html.erb
            show.html.erb
            new.html.erb
```
*erb extension: Embed Ruby for HTML*
- `git add & commit`

2. Edit `index.html.erb`:
```erb
<h1>Tweets#index</h1>

<%= link_to  "New Tweet", new_tweet_path %>

<% @tweets.each do |tweet| %>
  <p><%= tweet.body %></p>
  <%= link_to 'Show', tweet %>
<% end %>
```
- `git add & commit`

3. Edit `show.html.erb`
```erb
<h1>Tweets#show</h1>

<h3><%= @tweet.body %></h3>
<p><%= @tweet.updated_at %><p>
<%= link_to  "Back", :back %>
```
- `git add & commit`

4. Edit `new.html.erb`
```erb
<h1>Tweets#new</h1>

<%= form_with(model: @tweet, local: true) do |form| %>
  <div>
    <%= form.label :body %>
    <%= form.text_area :body %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>

<%= link_to  "Back", :back %>
```
- `git add & commit`

## Check your app on localhost !




# Rails Workshop 2019 Day 2
## Edit `tweets_controller` Part 2
0. Remind: Design of `tweets_controller`

| Action | Behavior |
| -: | :- |
| index | get all tweets |
| show | get a tweet |
| new | create a new tweet |
| create | post a new tweet to model |
| **edit** | **get a tweet for edit** |
| **update** | **post a edited tweet to model** |
| **destroy** | **destroy a tweet** |


1. Define `edit`, `update` and `destroy` method:
```ruby
class TweetsController < ApplicationController
  def index 
    @tweets = Tweet.all
  end

  def show 
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  # ------ start ------
  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  # ------  end  ------

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
```

- `git add & commit`

## **D**on't **R**epeat **Y**ourself
**DRY** is one of Ruby on Rails' philosophies.

It means you must reduce same programs as much as possible.

Now, We rewrite `tweets_controller` to follow DRY.

2. Define `set_tweet` method under `private`:
```ruby
class TweetsController < ApplicationController
  def index 
    @tweets = Tweet.all
  end

  def show 
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

    # ------ start ------
    def set_tweet
      @tweet = Tweet.find_by(id: params[:id])
    end
    # ------  end  ------
end
```

3. Set `before_action` to head of `tweets_controller` and remove same variables in some methods:
```ruby
class TweetsController < ApplicationController
  # ------ start ------
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  # ------  end  ------

  def index 
    @tweets = Tweet.all
  end

  def show 
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
  end

  def new
    @tweet = Tweet.new
  end

  def create
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
  end

  def update
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    # @tweet = Tweet.find_by(id: params[:id]) REMOVE
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

    def set_tweet
      @tweet = Tweet.find_by(id: params[:id])
    end
end
```


## Crete and Edit View files Part 2
1. Create `edit.html.erb` and `_form.html.erb`:
```
app/
    assets/
    channels/
    controllers/
    helpers/
    jobs/
    mailers/
    models/
  * views/
        layouts/
      * tweets/
            index.html.erb
            show.html.erb
            new.html.erb
          * edit.html.erb
          * _form.html.erb
```

`_form.html.erb` will use `new.html.erb` and `edit.html.erb` as partial.

- `git add & commit`

Partial is a shareble program for some view files.

2. Edit `_form.html.erb`:
```erb
<!-- rename @tweet to tweet -->
<%= form_with(model: tweet, local: true) do |form| %>
  <div>
    <h3><%= form.label :body %></h3>
    <%= form.text_area :body %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %>
```
- `git add & commit`

3. Add render partial to `new.html.erb` and remove previous program :
```erb
<h1>Create a new tweet</h1>

<!-- ADD -->
<%= render "form", tweet: @tweet %>
<!-- ADD -->

<%= link_to  "Back", tweets_path %>

<!-- REMOVE -->
 <%= form_with(model: @tweet, local: true) do |form| %>
  <div>
    <h3><%= form.label :body %></h3>
    <%= form.text_area :body %>
  </div>

  <div>
    <%= form.submit %>
  </div>
<% end %> 
<!-- REMOVE -->
```

4. Also, add render partial to `edit.html.erb`:
```erb
<h1>Edit a tweet</h1>
<%= render "form", tweet: @tweet %>
<%= link_to  "Back", tweets_path %>
```

- `git add & commit`

5. Add Edit and Delete button to `show.html.erb`:
```erb
<h1>Show a tweet</h1>

<h3><%= @tweet.body %></h3>
<p><%= @tweet.updated_at %><p>
<%= link_to  "Back", tweets_path %>

<!-- ADD -->
<%= link_to  "Edit", edit_tweet_path(@tweet) %>
<%= link_to 'Destroy', @tweet, method: :delete, data: { confirm: 'Are you sure?' } %>
<!-- ADD -->

```

## **Check your app on localhost**