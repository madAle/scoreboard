class ScoresController < ApplicationController
  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.order(points: :desc)
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.where(name: params[:name]).first
    if @score
      new_points = params[:points]
      @score.points = new_points if new_points > @score.points
    else
      @score = Score.new(name: params[:name], points: params[:points])
    end

    respond_to do |format|
      if @score.save
        @scores = Score.order(points: :desc)
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end
end
