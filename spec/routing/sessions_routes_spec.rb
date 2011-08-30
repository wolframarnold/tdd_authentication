require 'spec_helper'

describe SessionsController do
  it 'routes /sign_out to sessions#destroy' do
    get('/sign_out').should route_to(:controller => 'sessions', :action => 'destroy')
  end
end
