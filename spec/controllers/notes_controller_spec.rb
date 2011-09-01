require File.dirname(__FILE__) + '/../spec_helper'

describe NotesController do
  before do
    @note = Factory(:note)
    @note_other = Factory(:note, :uid => 'abcdefg')
  end

  context 'when not logged in' do

    it 'should redirect to login page' do
      get :index
      response.should redirect_to(root_path)
    end

  end

  context 'when logged in' do
    before do
      session[:uid] = @note.uid
      session[:provider] = @note.provider
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it 'shows only notes belonging to logged-in user' do
      get :index
      assigns[:notes].should == [@note]
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
      get :edit, :id => @note.id
      response.should render_template(:edit)
    end

    it "redirect when trying to edit someone else's note" do
      get :edit, :id => @note_other.id
      flash[:notice].should == "You can't access this note"
      response.should redirect_to(notes_path)
    end

    it "update action should render edit template when model is invalid" do
      put :update, :id => @note.id, :note => {:title => ''}
      response.should render_template(:edit)
    end

    it "redirect when trying to update someone else's note" do
      put :update, :id => @note_other.id, :note => {:title => 'Hack attack'}
      flash[:notice].should == "You can't access this note"
      response.should redirect_to(notes_path)
    end

    it "update action should redirect when model is valid" do
      put :update, :id => @note.id, :note => {:title => 'Yeah!'}
      response.should redirect_to(notes_url)
    end

    it "destroy action should destroy model and redirect to index action" do
      delete :destroy, :id => @note.id
      response.should redirect_to(notes_url)
      Note.exists?(@note.id).should be_false
    end

    it "redirects when trying to delete someone else's note" do
      expect {
        delete :destroy, :id => @note_other.id
      }.to_not change(Note,:count)
      flash[:notice].should == "You can't access this note"
      response.should redirect_to(notes_path)
    end


  end
end
