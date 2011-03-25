class ShootingRangesController < ApplicationController


  before_filter :authenticate_user! , :only => [:new, :create, :edit, :update, :destroy]


  # GET /shooting_ranges
  # GET /shooting_ranges.xml
  def index
    @shooting_ranges = ShootingRange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shooting_ranges }
    end
  end

  # GET /shooting_ranges/1
  # GET /shooting_ranges/1.xml
  def show
    @shooting_range = ShootingRange.find(params[:id])
    if  user_signed_in?
       @shooting_sessions = ShootingSession.where(:range_id => params[:id].to_i, :archer_id => current_user.id) 
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shooting_range }
    end
  end

  # GET /shooting_ranges/new
  # GET /shooting_ranges/new.xml
  def new
    @shooting_range = ShootingRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shooting_range }
    end
  end

  # GET /shooting_ranges/1/edit
  def edit
    @shooting_range = ShootingRange.find(params[:id])
  end

  # POST /shooting_ranges
  # POST /shooting_ranges.xml
  def create
    @shooting_range = ShootingRange.new(params[:shooting_range])

    respond_to do |format|
      if @shooting_range.save
        format.html { redirect_to(@shooting_range, :notice => 'Shooting range was successfully created.') }
        format.xml  { render :xml => @shooting_range, :status => :created, :location => @shooting_range }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shooting_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shooting_ranges/1
  # PUT /shooting_ranges/1.xml
  def update
    @shooting_range = ShootingRange.find(params[:id])

    respond_to do |format|
      if @shooting_range.update_attributes(params[:shooting_range])
        format.html { redirect_to(@shooting_range, :notice => 'Shooting range was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shooting_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_ranges/1
  # DELETE /shooting_ranges/1.xml
  def destroy
    @shooting_range = ShootingRange.find(params[:id])
    @shooting_range.destroy

    respond_to do |format|
      format.html { redirect_to(shooting_ranges_url) }
      format.xml  { head :ok }
    end
  end
end
