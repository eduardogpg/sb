class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:create]
  before_action :new_fact, only: [:create]

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
    respond_to do |format|
      if Fact.generate_with_tags(@fact, @tags)
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
    def fact
      params[:fact]
    end

    def tags
      params[:fact][:tags]
    end

    def has_tags?
      !tags.nil? && !tags.empty?
    end

    def set_tags
      @tags = Tag.get_or_create_tags_by_string(tags) if has_tags?
    end

    def new_fact 
      @fact = Fact.new_by_params(fact)
    end

    def set_fact
      @fact = Fact.find(params[:id])
    end
        
    def fact_params
      params.require(:fact).permit(:title, :description, :real, :color, :code, :resource)
    end
end
