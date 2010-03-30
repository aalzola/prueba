class MattersController < ApplicationController
  auto_complete_for :cityCouncil, :city 
  before_filter :login_required, :except => %w[ show ]
  # GET /matters
  # GET /matters.xml
  def index
    @matters = Matter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @matters }
    end
  end

 def mapa(latitude, longitude)
   coordinates = [latitude, longitude]   
   @map = GMap.new("map")
   @map.control_init(:large_map => true, :map_type => true)
   @map.center_zoom_init(coordinates,14)
   @map.overlay_init(GMarker.new(coordinates,:title => @matter.name , :info_window => @matter.name ))
   @map
end 
  # GET /matters/1
  # GET /matters/1.xml
  def show
    @matter = Matter.find(params[:id])
    
   @map = mapa(@matter.latitude, @matter.longitude)
   @comments = Comment.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @matter }
    end
  end

  # GET /matters/new
  # GET /matters/new.xml
  def new
    @matter = Matter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @matter }
    end
  end

  # GET /matters/1/edit
  def edit
    @matter = Matter.find(params[:id])
  end

  # POST /matters
  # POST /matters.xml
  def create
   @matter = Matter.new(params[:matter])
   @matter.city = params[:cityCouncil][:city]
   print "cooordenadas " + @matter.latitude + " " + @matter.longitude
   #@matter.latitude = params[:latitude]
   #@matter.longitude = params[:longitude]
    respond_to do |format|
      if @matter.save
        flash[:notice] = 'El asunto ha sido creado con exito.'
        format.html { redirect_to(@matter) }
        format.xml  { render :xml => @matter, :status => :created, :location => @matter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @matter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /matters/1
  # PUT /matters/1.xml
  def update
    @matter = Matter.find(params[:id])

    respond_to do |format|
      if @matter.update_attributes(params[:matter])
        flash[:notice] = 'matter was successfully updated.'
        format.html { redirect_to(@matter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @matter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.xml
  def destroy
    @matter = matter.find(params[:id])
    @matter.destroy

    respond_to do |format|
      format.html { redirect_to(matters_url) }
      format.xml  { head :ok }
    end
  end
end
