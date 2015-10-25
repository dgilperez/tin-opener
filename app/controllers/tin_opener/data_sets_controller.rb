require_dependency "tin_opener/application_controller"

module TinOpener
  class DataSetsController < ApplicationController
    before_action :set_data_set, only: [:show, :edit, :update, :destroy]

    # GET /data_sets
    def index
      @data_sets = DataSet.all
    end

    # GET /data_sets/1
    def show
      @records = @data_set.records
    end

    # GET /data_sets/new
    def new
      @data_set = DataSet.new
    end

    # GET /data_sets/1/edit
    def edit
    end

    # POST /data_sets
    def create
      @data_set = DataSet.new(data_set_params)

      if @data_set.save
        redirect_to @data_set, notice: 'Data set was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /data_sets/1
    def update
      if @data_set.update(data_set_params)
        redirect_to @data_set, notice: 'Data set was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /data_sets/1
    def destroy
      @data_set.destroy
      redirect_to data_sets_url, notice: 'Data set was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_data_set
        @data_set = DataSet.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def data_set_params
        params.require(:data_set).permit(:name, :headers, :data_file)
      end
  end
end
