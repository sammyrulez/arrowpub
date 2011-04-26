

class ShootingSessionsController < ApplicationController



  before_filter :grab_range_from_id
  
  before_filter :authenticate_user! , :only => [:new, :create, :edit, :update, :destroy]

  # GET /shooting_sessions
  # GET /shooting_sessions.xml
  def index
    @shooting_sessions = ShootingSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shooting_sessions }
    end
  end

  # GET /shooting_sessions/1
  # GET /shooting_sessions/1.xml
  def show
    @shooting_session = ShootingSession.find(params[:id])

    @stats_count = @shooting_session.stats
    @graph = open_flash_chart_object(300,300,"/shooting_ranges/1/shooting_sessions/1/stats_count_pie")


   @shooting_rounds = []
   if @shooting_session.rounds 
     @shooting_rounds = @shooting_session.rounds 
   end
   

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shooting_session }
    end
  end


  def stats_count_pie
    title = Title.new("Arrow Distribution")
     shooting_session = ShootingSession.find(params[:shooting_session_id])
    stats_count = shooting_session.stats

    pie = Pie.new
    pie.start_angle = 15
    pie.animate = true
    pie.tooltip = '#val# of #total#<br>#percent# of 100%'
    pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
    pie.values  = [ PieValue.new(stats_count.targets.to_i,"On Target"), PieValue.new(stats_count.spots.to_i,"Spots") ,PieValue.new(stats_count.arrows.to_i - stats_count.targets.to_i - stats_count.spots.to_i,"Misses")]

    chart = OpenFlashChart.new
    chart.title = title
    chart.add_element(pie)

    chart.x_axis = nil

    render :text => chart.to_s
  end


  # GET /shooting_sessions/new
  # GET /shooting_sessions/new.xml
  def new
    @shooting_session = ShootingSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shooting_session }
    end
  end

  # GET /shooting_sessions/1/edit
  def edit
    @shooting_session = ShootingSession.find(params[:id])
  end

  # POST /shooting_sessions
  # POST /shooting_sessions.xml
  def create
    @shooting_session = ShootingSession.new(params[:shooting_session])
    @shooting_session.shooting_range = @shooting_range
    @shooting_session.owner = current_user
    
    logger.debug "Owner #{@shooting_session.owner}"

    respond_to do |format|
      if @shooting_session.save
        format.html { redirect_to([ @shooting_range,@shooting_session], :notice => 'Shooting session was successfully created.') }
        format.xml  { render :xml => @shooting_session, :status => :created, :location => @shooting_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shooting_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shooting_sessions/1
  # PUT /shooting_sessions/1.xml
  def update
    @shooting_session = ShootingSession.find(params[:id])

    respond_to do |format|
      if @shooting_session.update_attributes(params[:shooting_session])
        format.html { redirect_to(@shooting_session, :notice => 'Shooting session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shooting_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_sessions/1
  # DELETE /shooting_sessions/1.xml
  def destroy
    @shooting_session = ShootingSession.find(params[:id])
    @shooting_session.destroy

    respond_to do |format|
      format.html { redirect_to(shooting_sessions_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def grab_range_from_id
  
  	@shooting_range = ShootingRange.find(params[:shooting_range_id])
    
  end
  
end
