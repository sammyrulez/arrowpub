class DashboardController < ApplicationController


  before_filter :authenticate_user! , :only => [:stats_count_pie]

  def index

    @shooting_ranges = ShootingRange.find(:all)

    if  user_signed_in?

      @shooting_sessions = ShootingSession.find_all_by_archer_id current_user.id
      @arrows_chart = open_flash_chart_object(300,300,"/dashboard/stats_count_pie")



    end

  end
  
  def stats_count_pie
    title = Title.new("Arrow Distribution")

    stats_count = current_user.stats

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

  def stats_trend_lines
    
  end

end
