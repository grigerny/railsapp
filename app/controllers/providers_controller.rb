class ProvidersController < ApplicationController
  # GET /providers/1
  # GET /providers/1.json
  def show
    @provider = Provider.find(params[:id])
    @json = Provider.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provider }
    end
  end

  # GET /providers/new
  # GET /providers/new.json
  def new
    @provider = Provider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @provider }
    end
  end


  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(params[:provider])
    @provider.user = current_user

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render json: @provider, status: :created, location: @provider }
      else
        format.html { render action: "new" }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
      @provider = Provider.find(params[:id])
      @provider.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "Thanks for voting!"
  end
end


