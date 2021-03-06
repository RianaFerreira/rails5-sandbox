class IdeasController < ApplicationController
  before_action :set_idea, except: [:index, :new, :create]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = cell(:idea, collection: Idea.order(created_at: :desc))
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show; end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        IdeaBroadcastJob.perform_later(@idea)
        format.html { redirect_to(@idea, flash: { success: I18n.t(".success") }) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /ideas/1/edit
  def edit; end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to(@idea, flash: { success: I18n.t(".success") }) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to(ideas_url, flash: { success: I18n.t(".success") }) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description)
    end
end
