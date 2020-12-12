require 'sinatra'


class Web < Sinatra::Base
  @@user = 'sshlykov'
  @@plain_text = "text/plain; charset=UTF-8"
  
  before do
    headers['X-Author'] = @@user
    headers['Access-Control-Allow-Origin'] = "*"
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
    "function task(x){ (value => new Promise((res, rej) => (value < 18 ? res(\"yes\") : rej(\"no\"))))(x) }"
  end
  get /\/fetch\/?/ do
    erb :index
  end
end