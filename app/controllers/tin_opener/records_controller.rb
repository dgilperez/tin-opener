require_dependency "tin_opener/application_controller"

module TinOpener
  class RecordsController < ApplicationController
    before_action :set_data_set
    before_action :set_record, only: [:show, :edit, :update, :destroy]

    def index
      @records = @data_set.records
    end

    def show
    end

    def new
      @record = @data_set.records.new
    end

    def edit
    end

    def create
      @record = @data_set.records.new(record_params)

      if @record.save
        redirect_to data_set_record_url(@data_set, @record), notice: 'Record was successfully created.'
      else
        render :new
      end
    end

    def update
      if @record.update(record_params)
        redirect_to data_set_record_url(@data_set, @record), notice: 'Record was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @record.destroy
      redirect_to data_set_records_url(@data_set), notice: 'Record was successfully destroyed.'
    end

    private
      def set_data_set
        @data_set = DataSet.find(params[:data_set_id])
      end

      def set_record
        @record = @data_set.records.find(params[:id])
      end

      def record_params
        row_data = params[:record].delete(:row_data)
        # ActionController::Parameters.new(record: { row_data: row_data })
        params[:record].permit!.tap do |whitelisted|
          whitelisted[:row_data] = row_data
        end
      end
  end
end
