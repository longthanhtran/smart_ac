class AcsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_ac, only: %i[ show edit update destroy ]

  # GET /acs or /acs.json
  def index
    @acs = Ac.all
  end

  # GET /acs/1 or /acs/1.json
  def show
  end

  # GET /acs/new
  def new
    @ac = Ac.new
  end

  # GET /acs/1/edit
  def edit
  end

  # POST /acs or /acs.json
  def create
    @ac = Ac.new(ac_params)

    respond_to do |format|
      if @ac.save
        format.html { redirect_to ac_url(@ac), notice: "Ac was successfully created." }
        format.json { render :show, status: :created, location: @ac }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acs/1 or /acs/1.json
  def update
    respond_to do |format|
      if @ac.update(ac_params)
        format.html { redirect_to ac_url(@ac), notice: "Ac was successfully updated." }
        format.json { render :show, status: :ok, location: @ac }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acs/1 or /acs/1.json
  def destroy
    @ac.destroy

    respond_to do |format|
      format.html { redirect_to acs_url, notice: "Ac was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ac
      @ac = Ac.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ac_params
      params.require(:ac).permit(:serial_number, :registration_date, :firmware_version)
    end
end