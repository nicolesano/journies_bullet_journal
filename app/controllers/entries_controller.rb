class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update]

  def show
  end

  def new
    @entry = current_user.entries.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @entry.update(entry_params)
    redirect_to dashboard_path
  end

  private

    def entry_params
      params.require(:entry).permit(:user, :title, :mood, :content)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end  
end
