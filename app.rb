require 'sinatra'


class Web < Sinatra::Base
  @@user = 'sshlykov'
  @@plain_text = "text/plain; charset=UTF-8"
  
  before do
    headers['X-Author'] = @@user
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = "GET,POST,PUT,DELETE,OPTIONS"
    headers['Access-Control-Allow-Headers'] = "x-test,Content-Type,Accept,Access-Control-Allow-Headers"
  end
  
  get /\/?/ do
    headers['Content-Type'] = @@plain_text
    @@user
  end
  get /\/login\/?/ do
    headers['Content-Type'] = @@plain_text
    @@user
  end
  
  get /\/sample\/?/ do
    headers['Content-Type'] = @@plain_text
    "function task(x) {return x * this**2;}"
  end

  get /\/promise\/?/ do
    headers['Content-Type'] = @@plain_text
    "function task(x){ return new Promise((res, rej) => x < 18 ? res('yes') : rej('no')); }"
  end
  get /\/fetch\/?/ do
    erb :index
  end
end