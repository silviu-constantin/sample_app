class QrcodesController < ApplicationController
  before_action :logged_in_user
  before_action only: [:new,:edit, :update, :destroy, :update, :show_order] do |c|   c.is_owner("bindu") end
  before_action only: [:index, :show, :create, :current_user_qrcodes_index] do |c|   c.is_owner(nil) end
  before_action :set_qrcode, only: [:show, :edit, :update, :destroy]

  # GET /qrcodes
  # GET /qrcodes.json
  # def index
  #   @qrcodes = current_user.qrcodes.where(name: "bindu")
  # end

  def current_user_qrcodes_bindu
    @qrcodes = current_user.qrcodes.where(name: "bindu")
  end

  # GET /qrcodes/1
  # GET /qrcodes/1.json
  def show
  end

  # GET /qrcodes/1
  # GET /qrcodes/1.json
  def show_order
  end

  # GET /qrcodes/new
  def new
    @qrcode = Qrcode.new
  end

  # GET /qrcodes/1/edit
  def edit
  end

  # POST /qrcodes
  # POST /qrcodes.json
  def create
    @qrcode = current_user.qrcodes.build(qrcode_params)
    @qrcode.save
    #@qrcode = Qrcode.new(qrcode_params)
    meniu = ""
    name = ""
    line_break = "\r\n"
    params[:qrcode][:name].each_with_index do |p, i|
      ff = JSON.parse(params[:qrcode][:name][i])
      meniu += ff["menu"] + line_break
      name = ff["name"]
    end
    params = meniu
    @qrcode.name = name
    @qrcode.generate_qr(params)

    respond_to do |format|
      if @qrcode.save
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully created.' }
        format.json { render :show, status: :created, location: @qrcode }
      else
        format.html { render :new }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrcodes/1
  # PATCH/PUT /qrcodes/1.json
  def update
    respond_to do |format|
      if @qrcode.update(qrcode_params)
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @qrcode }
      else
        format.html { render :edit }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrcodes/1
  # DELETE /qrcodes/1.json
  def destroy
    @qrcode.destroy
    respond_to do |format|
      format.html { redirect_to qrcodes_url, notice: 'Qrcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrcode
      @qrcode = Qrcode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qrcode_params
      params.require(:qrcode).permit(:name)
    end
end
