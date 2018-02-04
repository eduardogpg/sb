class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy]

  def index
    @facts = Fact.all
  end

  def show
  end

  def new
    @fact = Fact.new
  end

  def edit
  end

  def create
    @fact = Fact.new(fact_params)
    respond_to do |format|
      if @fact.save
        format.html { redirect_to facts_path, notice: 'Dato generado exitosamente' }
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to @fact, notice: 'Dato actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to facts_url, notice: 'Dato eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_fact
      @fact = Fact.find(params[:id])
    end
        
    def fact_params
      params.require(:fact).permit(:title, :description, :real, :color, :code, :resource, :labels)
    end
end
