class BuysController < ApplicationController
  def index
    @buy = Buy.find(params[:id])
  end

  def create
  end