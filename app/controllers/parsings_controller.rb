require 'nokogiri'
require 'open-uri'

class ParsingsController < ApplicationController
  def index

    @parsings = Parsing.all
  end

  def new
    @parsing = Parsing.new
  end

  def show
    @parsing = Parsing.find(params[:id])
  end

  def create
    @parsing = Parsing.new(parsing_params)
    if @parsing.save
      redirect_to @parsing
    else
      render 'new'
    end

  end

  def destroy
    respond_with(parsing.destroy, location: root_path)
  end

  private

    def parsing
      @parsing ||= Parsing.find_by_id(params[:id])
    end

    def parsing_params
      params.require(:parsing).permit(:name, :html_resource)
    end
end
