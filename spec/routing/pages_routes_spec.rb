require 'spec_helper'

describe PagesController do

  it 'should route / to pages#index' do
    get('/').should route_to(:controller => 'pages', :action => 'home')
  end
  
end
