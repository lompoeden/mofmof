class PropertiesController < ApplicationController
  before_action :set_property, only: [:show,:edit,:update,:destroy]

    def index
      @properties = Property.all
    end

    def new
      @property = Property.new
      2.times { @property.stations.build }
     end

     def create
       @property = Property.new(property_params)

        respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end
    def show
    end

    def edit
      @property.stations.build
    end

    def update
      if @property.update(property_params)
        redirect_to properties_path, notice: "property was updated successfully！"
      else
        render :edit
      end
    end

    def destroy
      @property.destroy
      respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
    end
  end

    private
        def set_property
          @property = Property.find(params[:id])
        end
        def property_params
          params.require(:property).permit(:name, :rent,:address,:age, :remarks, :content, :stations_attributes [ :station_name,:line_name,:minutes_on_foot, :id ])
    end
  end
