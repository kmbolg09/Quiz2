class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea=Idea.find(params[:id])
    @comment = Comment.new( :idea => @idea )
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    
    @idea = Idea.new(idea_params)
      if @idea.save
         redirect_to @idea, notice: 'Idea was successfully created.' 
         
      else
         render action: 'new' 
        
     
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    
      if @idea.update(idea_params)
         redirect_to "/", notice: 'Idea was successfully updated.' 
         
      else
        render action: 'edit' 
         
      
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
      if @idea.destroy
       redirect_to ideas_url 
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
