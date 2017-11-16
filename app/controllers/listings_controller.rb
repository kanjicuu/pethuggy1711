class ListingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_listing, only:[:update, :basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish]


  def index
  end

  def show
  end

  def new
    #現在のユーザーもlistingの作成
    @listing = current_user.listings.build
  end

  def create
    #パラメーターととと現在のユーザーのlistingを作成
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成・保存しました。"
    else
      redirect_to new_listing_path, notice: "リスティングを作成・保存できませんでした。"
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params) #下の関数見て！
      redirect_to :back, notice: "更新できました。"
    end
  end

  def basics
  end

  def description
  end

  def address
  end

  def price
  end

  def photos
    @photo = Photo.new #photoモデルの新しいものを作る。
  end

  def calender
  end
  
  def bankaccount
  end

  def publish
  end

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight, :address, :active)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
