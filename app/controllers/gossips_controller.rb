class GossipsController < ApplicationController
  def index
    if user_signed_in?
      @gossip = Gossip.all
    else
      redirect_to home_warning_path
    end
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_record_params)
    @gossip.user_id = current_user.id
    if @gossip.save
      @gossip.save
      redirect_to @gossip
    else
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
  	if @gossip.user_id == current_user.id
	  	@gossip.destroy
	  	flash[:success] = "C'est dommage que t'assumes pas... mais supprimé !"
	  	redirect_to root_path
	else
		flash[:danger] = "Nope, ça n'est pas ton gossip petit malin !"
	  	redirect_to root_path
	end
  end

private

  def gossip_record_params
  	params.permit(:content, :timestamps)
  end

  def gossip_params
  	params.require(:gossip).permit(:content, :timestamps, :user_id)
  end

end
