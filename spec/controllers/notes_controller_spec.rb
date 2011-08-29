require File.dirname(__FILE__) + '/../spec_helper'

describe NotesController do
  let(:note) { Factory(:note) }

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :note => {}
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :note => {:title => "Hey"}
    response.should redirect_to(notes_url)
  end

  it "edit action should render edit template" do
    get :edit, :id => note.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => note.id, :note => {:title => ''}
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => note.id, :note => {:title => 'Yeah!'}
    response.should redirect_to(notes_url)
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => note.id
    response.should redirect_to(notes_url)
    Note.exists?(note.id).should be_false
  end
end
