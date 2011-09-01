class NotesController < ApplicationController

  before_filter :authenticate!
  before_filter :find_note!, :only => [:edit, :update, :destroy]

  def index
    @notes = Note.mine(session[:uid], session[:provider]).all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    @note.uid = session[:uid]
    @note.provider = session[:provider]
    if @note.save
      redirect_to notes_url, :notice => "Successfully created note."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(params[:note])
      redirect_to notes_url, :notice  => "Successfully updated note."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, :notice => "Successfully destroyed note."
  end

  private

  def find_note!
    @note = Note.mine(session[:uid],session[:provider]).where(:id => params[:id]).first
    if @note.nil?
      flash[:notice] = "You can't access this note"
      redirect_to notes_path
    end
  end

end
