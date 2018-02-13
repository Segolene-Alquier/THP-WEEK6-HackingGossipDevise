class GossipsController < ApplicationController
  def index
    @gossip = Gossip.all
  end

  def new
    @gossip =Gossip.new
  end

  def create
  end

  def show
  end
end
