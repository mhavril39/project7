require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    @holidays_now = HolidApi.get(country: 'US', month: (Date.today.strftime("%m")))
    @holidays_birth = HolidApi.get(country: 'US', year: '1993', month: '1')
    erb :index
  end
end