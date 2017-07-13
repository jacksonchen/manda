class OffersController < ApplicationController
  def index
    if current_user.buyer?
      @offers = current_user.buyer.offers
    else
      @offers = current_user.seller.company.offers
    end
  end


  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Offer successfully made"
      redirect_to root_path
    else
      render 'companies/show'
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.status = params[:status]
    if @offer.save
      flash[:success] = "Successfully #{@offer.status} offer"
      redirect_to root_path
    else
      flash[:error] = "Could not accept offer. Please try again later."
      render 'index'
    end
  end

  private

    def offer_params
      params.require(:offer).permit(:status, :price, :company_id, :buyer_id)
    end
end
