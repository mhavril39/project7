require 'sinatra'
require 'holidapi'

class MyWebApp < Sinatra::Base
  get '/' do
    if params ['year'] != nil && params ['year'] != ""
      if params ['month'] != nil && params ['month'] != ""
        if params ['country'] != nil && params ['country'] != ""
          @holidays_yourbirth = HolidApi.get(country: params['country'], year: params['year'], month: params['month'])
        else
          @holidays_yourbirth = HolidApi.get(country: 'US', year: params['year'], month: params['month'])
        end
      else
        @holidays_yourbirth = HolidApi.get(country: 'US', year: params['year'], month:(Date.today.strftime("%m")))
      end
    else
      @holidays_yourbirth = HolidApi.get(country: 'US', year:(Date.today.strftime("%Y")), month:(Date.today.strftime("%m")))
    end
    puts params
    erb :index
  end
end