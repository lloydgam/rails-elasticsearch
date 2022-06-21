class MbsItemsController < ApplicationController
  before_action :set_mbs_item, only: %i[ show edit update destroy ]

  # GET /mbs_items or /mbs_items.json
  def index
    if params[:query].present?
      @mbs_items = MbsItem.search(params[:query]).records
    else
      @mbs_items = MbsItem.all
    end
  end

  # GET /mbs_items/1 or /mbs_items/1.json
  def show
  end

  # GET /mbs_items/new
  def new
    @mbs_item = MbsItem.new
  end

  # GET /mbs_items/1/edit
  def edit
  end

  # POST /mbs_items or /mbs_items.json
  def create
    @mbs_item = MbsItem.new(mbs_item_params)

    respond_to do |format|
      if @mbs_item.save
        format.html { redirect_to mbs_item_url(@mbs_item), notice: "Mbs item was successfully created." }
        format.json { render :show, status: :created, location: @mbs_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mbs_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mbs_items/1 or /mbs_items/1.json
  def update
    respond_to do |format|
      if @mbs_item.update(mbs_item_params)
        format.html { redirect_to mbs_item_url(@mbs_item), notice: "Mbs item was successfully updated." }
        format.json { render :show, status: :ok, location: @mbs_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mbs_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mbs_items/1 or /mbs_items/1.json
  def destroy
    @mbs_item.destroy

    respond_to do |format|
      format.html { redirect_to mbs_items_url, notice: "Mbs item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mbs_item
      @mbs_item = MbsItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mbs_item_params
      params.require(:mbs_item).permit(:reference, :start_date, :end_date, :is_latest, :description)
    end
end
