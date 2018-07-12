# SessionSecretGenerator

This is a super simple gem used to generate session secrets using a SecureRandom hex. This is useful if you're using a framework like Sinatra to build your webapp and want to make sure your sessions are secure.

## Installation

    $ gem install session_secret_generator

## Usage

    $ generate_secret

This will output a 128 character hexadecimal string that you can use as a session secret. You can then add 
```
SESSION_SECRET=yourlonghexadecimalstringhere
```
to your .env file at the root of your project to keep your secret out of version control. You'll want to install the [dotenv gem](https://github.com/bkeepers/dotenv) for this purpose. 

There are 2 things you need to do to make sure this secret is read by your application.

1. Load your .env file from config.ru by adding 
```
require 'dotenv/load'
``` 
2. Tell Sinatra about your secret by adding it to your configuration in your application controller. Adding these lines:

```
set :session_secret, ENV.fetch('SESSION_SECRET')
```

Here's a basic example in context:


```
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') 
  end

  get "/" do
    erb :"/posts/index.html"
  end
end
```
