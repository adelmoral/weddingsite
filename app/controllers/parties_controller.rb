class PartiesController < ApplicationController

http_basic_authenticate_with :name => "tempest", :password => "20bbgrev03", :only => ["new", "index", "show"]

  def new
    @party = Party.new
  end

  def index
    @parties = Party.all
  end

  def show
    if params.has_key?(:rsvp_code)
      @party = Party.find_by(rsvp_code: params[:rsvp_code])
    else
      @party = Party.find(params[:id])
    end
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      flash[:notice] = "Party successfully created"
      redirect_to @party
    else
      render 'new'
    end
  end

  def edit
    if params.has_key?(:rsvp_code)
      @party = Party.find_by(rsvp_code: params[:rsvp_code])
    else
      @party = Party.find(params[:id])
    end
  end

  def update
    @party = Party.find(params[:id])
    if @party.update_attributes(party_params)
      flash[:notice] = "Your RSVP has been received!"
      redirect_to '/home'
    else
      render 'edit'
    end
  end

  def search
    @party = Party.find(params[:search])
    redirect_to @party
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to parties_path
  end

  private
    def party_params
      params.require(:party).permit(:rsvp_code, :party_name, :num_guests, :num_nights, :child, :rsvp_guests, :rsvp_nights, :guest_names, :email, :special_accom)
    end

end
