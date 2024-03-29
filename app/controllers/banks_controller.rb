# frozen_string_literal: true

class BanksController < ApplicationController
  before_action :set_bank, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /banks or /banks.json
  def index
    @banks = Bank.paginate(page: params[:page], per_page: 10)
  end

  # GET /banks/1 or /banks/1.json
  def show; end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit; end

  # POST /banks or /banks.json
  def create
    @bank = Bank.new(bank_params)

    respond_to do |format|
      if @bank.save
        format.html do
          redirect_to bank_url(@bank, locale: I18n.locale), notice: t('banks.form.success_messages.create')
        end
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banks/1 or /banks/1.json
  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html do
          redirect_to bank_url(@bank, locale: I18n.locale), notice: t('banks.form.success_messages.update')
        end
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banks/1 or /banks/1.json
  def destroy
    @bank.destroy!

    respond_to do |format|
      format.html { redirect_to banks_url, notice: t('banks.form.destroy_success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bank
    @bank = Bank.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bank_params
    params.require(:bank).permit(:name)
  end
end
