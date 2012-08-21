class ServicesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /services
  # GET /services.json
  def index
    @services = Service.search(params[:search])
    @providers = Provider.all
    @comments = Comment.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
       @service = Service.find(params[:id])
               @providers = @service.providers.find_with_reputation(:votes, :all, order: "votes desc")
               @json = @service.providers.all.to_gmaps4rails

               if params[:search].present?
                   @providers = @service.providers.near(params[:search], 50, :order => :distance)
                   @json = @service.providers.near(params[:search], 50, :order => :distance).to_gmaps4rails
                   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end
end


  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
