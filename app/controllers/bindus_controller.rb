class BindusController < ApplicationController
  before_action :logged_in_user
  before_action only: [:new, :create, :edit, :update, :destroy, :show, :update] do |c|   c.is_owner("bindu") end
  before_action only: [:order] do |c|   c.is_owner(nil) end
  before_action :set_bindu, only: [:show, :edit, :update, :destroy]

  # GET /bindus
  # GET /bindus.json
  def index
    @bindus = Bindu.all
  end

  def order
    @bindus = Bindu.all
    @new_order = Qrcode.new
  end

  # GET /bindus/1
  # GET /bindus/1.json
  def show
  end

  # GET /bindus/new
  def new
    @bindu = Bindu.new
  end

  # GET /bindus/1/edit
  def edit
  end

  # POST /bindus
  # POST /bindus.json
  def create
    @bindu = Bindu.new(bindu_params)

    respond_to do |format|
      if @bindu.save
        format.html { redirect_to @bindu, notice: 'Bindu was successfully created.' }
        format.json { render :show, status: :created, location: @bindu }
      else
        format.html { render :new }
        format.json { render json: @bindu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bindus/1
  # PATCH/PUT /bindus/1.json
  def update
    respond_to do |format|
      if @bindu.update(bindu_params)
        format.html { redirect_to @bindu, notice: 'Bindu was successfully updated.' }
        format.json { render :show, status: :ok, location: @bindu }
      else
        format.html { render :edit }
        format.json { render json: @bindu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bindus/1
  # DELETE /bindus/1.json
  def destroy
    @bindu.destroy
    respond_to do |format|
      format.html { redirect_to bindus_url, notice: 'Bindu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bindu
      @bindu = Bindu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bindu_params
      defaults = {name: 'bindu'}
      params.require(:bindu).permit(:name, :price, :menu).reverse_merge(defaults)
      #params.require(:bindu).permit(:name, :price, :menu)
    end
end
