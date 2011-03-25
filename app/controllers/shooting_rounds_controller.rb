class ShootingRoundsController < ApplicationController

  before_filter :grab_range_and_session_from_id
  before_filter :authenticate_user! , :only => [:new, :create, :edit, :update, :destroy]


  # GET /shooting_rounds
  # GET /shooting_rounds.xml
  def index
    @shooting_rounds = ShootingRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shooting_rounds }
    end
  end

  # GET /shooting_rounds/1
  # GET /shooting_rounds/1.xml
  def show
    @shooting_round = ShootingRound.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shooting_round }
    end
  end

  # GET /shooting_rounds/new
  # GET /shooting_rounds/new.xml
  def new
    @shooting_round = ShootingRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shooting_round }
    end
  end

  # GET /shooting_rounds/1/edit
  def edit
    @shooting_round = ShootingRound.find(params[:id])
  end

  # POST /shooting_rounds
  # POST /shooting_rounds.xml
  def create
    @shooting_round = ShootingRound.new(params[:shooting_round])
    @shooting_round.s_session = @shooting_session

    respond_to do |format|
      if @shooting_round.save
        format.html { redirect_to(shooting_back() , :notice => 'Shooting round was successfully created.') }
        format.xml  { render :xml => @shooting_round, :status => :created, :location => @shooting_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shooting_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shooting_rounds/1
  # PUT /shooting_rounds/1.xml
  def update
    @shooting_round = ShootingRound.find(params[:id])

    respond_to do |format|
      if @shooting_round.update_attributes(params[:shooting_round])
        format.html { redirect_to(shooting_back() , :notice => 'Shooting round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shooting_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_rounds/1
  # DELETE /shooting_rounds/1.xml
  def destroy
    @shooting_round = ShootingRound.find(params[:id])
    @shooting_round.destroy

    respond_to do |format|
      format.html { redirect_to(shooting_back() ) }
      format.xml  { head :ok }
    end
  end
  
  private

  def grab_range_and_session_from_id

    @shooting_range = ShootingRange.find(params[:shooting_range_id])
    @shooting_session = ShootingSession.find(params[:shooting_session_id])

  end
  
  def shooting_back() 
  
    shooting_range_shooting_session_url(@shooting_range , @shooting_session)
  	
  end
  
  
end
