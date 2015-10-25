require_dependency "tin_opener/application_controller"

module TinOpener
  class DataSetsController < ApplicationController
    before_action :set_data_set, only: [:show, :edit, :update, :destroy]

    def index
      @data_sets = DataSet.all
      @data_set  = DataSet.new
    end

    def show
      @records = @data_set.records
    end

    def edit
    end

    def create
      @data_set = DataSet.new(data_set_params)

      if @data_set.save
        redirect_to @data_set, notice: 'Data set was successfully created.'
      else
        @data_sets = DataSet.all
        render :index
      end
    end

    def update
      if @data_set.update(data_set_params)
        redirect_to @data_set, notice: 'Data set was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @data_set.destroy
      redirect_to data_sets_url, notice: 'Data set was successfully destroyed.'
    end

    private
      def set_data_set
        @data_set = DataSet.find(params[:id])
      end

      def data_set_params
        params.require(:data_set).permit(:name, :headers, :data_file)
      end
  end
end
