class FlamesController < ApplicationController
  before_action :set_flame, only: [:show, :edit, :update, :destroy]

  # GET /flames
  # GET /flames.json
  def index
    @flames = Flame.all
  end

  # GET /flames/1
  # GET /flames/1.json
  def show
  end

  # GET /flames/new
  def new
    @flame = Flame.new
  end

  # GET /flames/1/edit
  def edit
  end

  # POST /flames
  # POST /flames.json
  def create
    @flame = Flame.new(flame_params)

    respond_to do |format|
      if @flame.save
        format.html { redirect_to @flame, notice: 'Flame was successfully created.' }
        format.json { render :show, status: :created, location: @flame }
      else
        format.html { render :new }
        format.json { render json: @flame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flames/1
  # PATCH/PUT /flames/1.json
  def update
    respond_to do |format|
      if @flame.update(flame_params)
        format.html { redirect_to @flame, notice: 'Flame was successfully updated.' }
        format.json { render :show, status: :ok, location: @flame }
      else
        format.html { render :edit }
        format.json { render json: @flame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flames/1
  # DELETE /flames/1.json
  def destroy
    @flame.destroy
    respond_to do |format|
      format.html { redirect_to flames_url, notice: 'Flame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flame
      @flame = Flame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flame_params
      params.require(:flame).permit(:name, :description)
    end
end
