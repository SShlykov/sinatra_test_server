require 'sinatra'

class Web < Sinatra::Base
  get /\/?/ do
    @user = 'sshlykov'
    headers['X-Author'] = @user
    headers['Content-Type'] = "text/plain; charset=UTF-8"
    headers['Access-Control-Allow-Origin'] = "*"

    @user
  end
  get /\/login\/?/ do
    @user = 'sshlykov'
    headers['X-Author'] = @user
    headers['Content-Type'] = "text/plain; charset=UTF-8"
    headers['Access-Control-Allow-Origin'] = "*"

    @user
  end


  get /\/sample\/?/ do
    @user = 'sshlykov'
    headers['Content-Type'] = "text/plain; charset=UTF-8"
    headers['Access-Control-Allow-Origin'] = "*"

  "function task(x) {
    return x * this**2
  }"
  end
end