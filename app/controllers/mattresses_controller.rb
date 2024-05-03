# frozen_string_literal: true

class MattressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mattress, only: %i[show edit update destroy]

  # GET /mattresses or /mattresses.json
  def index
    @mattresses = Mattress.all
    @is_index = true
  end

  # GET /mattresses/1 or /mattresses/1.json
  def show; end

  # GET /mattresses/new
  def new
    @mattress = Mattress.new
  end

  # GET /mattresses/1/edit
  def edit; end

  # POST /mattresses or /mattresses.json
  def create
    @mattress = Mattress.new(mattress_params)

    respond_to do |format|
      if @mattress.save
        format.html { redirect_to mattress_url(@mattress), notice: 'Mattress was successfully created.' }
        format.json { render :show, status: :created, location: @mattress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mattress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mattresses/1 or /mattresses/1.json
  def update
    respond_to do |format|
      if @mattress.update(mattress_params)

        format.html { redirect_to mattress_url(@mattress), notice: 'Mattress was successfully updated.' }
        format.json { render :show, status: :ok, location: @mattress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mattress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mattresses/1 or /mattresses/1.json
  def destroy
    @mattress.destroy!

    respond_to do |format|
      format.html { redirect_to mattresses_url, notice: 'Mattress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mattress
    @mattress = Mattress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mattress_params
    params.require(:mattress).permit(:company, :confort, :size, :name, :description, images: [])
  end
end
