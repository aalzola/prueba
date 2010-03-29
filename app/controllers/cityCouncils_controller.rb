classCityCouncilsController < ApplicationController
  # GET /municipios
  # GET /municipios.xml
  def index
    #@municipios =CityCouncil.all
    page = params[:page] || 1
    @cityCouncil = CityCouncil.paginate :page => page

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml =>@cityCouncils }
    end
  end

  # GET /municipios/1
  # GET /municipios/1.xml
  def show
   @cityCouncil =CityCouncil.find(params[:id])
    
    direccion =@cityCouncil.direccionVia + ' ' +@cityCouncil.municipio + ' ' +@cityCouncil.provincia
    print 'xxxxxxxxxx ' + direccion
    #direccion ="Francisco Durrio Bilbao"
    @map = GMap.new("map_div_id")
    @map.control_init(:large_map => true, :map_type => true)
    
    results = Geocoding::get(direccion)
            if results.status == Geocoding::GEO_SUCCESS
                    coord = results[0].latlon
                    @map.overlay_init(GMarker.new(coord,:info_window => "direccion"))
            end
            
    @map.center_zoom_init(coord, 15)

    @map.overlay_init(GMarker.new(direccion, :title => "geocoded", :info_window => direccion))


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml =>@cityCouncil }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.xml
  def new
   @cityCouncil =CityCouncil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml =>@cityCouncil }
    end
  end

  # GET /municipios/1/edit
  def edit
   @cityCouncil =CityCouncil.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.xml
  def create
   @cityCouncil =CityCouncil.new(params[:municipio])

    respond_to do |format|
      if@cityCouncil.save
        flash[:notice] = 'Municipio was successfully created.'
        format.html { redirect_to(@municipio) }
        format.xml  { render :xml =>@cityCouncil, :status => :created, :location =>@cityCouncil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml =>@cityCouncil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.xml
  def update
   @cityCouncil =CityCouncil.find(params[:id])

    respond_to do |format|
      if@cityCouncil.update_attributes(params[:municipio])
        flash[:notice] = 'Municipio was successfully updated.'
        format.html { redirect_to(@municipio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml =>@cityCouncil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.xml
  def destroy
   @cityCouncil =CityCouncil.find(params[:id])
   @cityCouncil.destroy

    respond_to do |format|
      format.html { redirect_to(municipios_url) }
      format.xml  { head :ok }
    end
  end
end
