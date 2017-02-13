class ReportingController < ApplicationController
    include ReportingHelper
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
  
  def index
    today = Date.today
    days =  Date.today - 7.days
    thirty = Date.today - 30.days
    six = Date.today - 6.months
    yearly = Date.today - 1.year

    games = Game.all
    one_day = games.where('created_at >= ?', today)
    s_day = games.where('created_at >= ?', days)
    thirty_day = games.where('created_at >= ?', thirty)
    six_month = games.where('created_at >= ?', six)
    year = games.where('created_at >= ?', yearly)
    
    total = games.length
    month = thirty_day.length
    six_months = six_month.length
    year_count = year.length
    daily = one_day.length
    weekly = s_day.length

    @total = total
    @month = month
    @six_months = six_months
    @year_count = year_count
    @daily = daily
    @weekly = weekly
    
    @chart = chart_one(daily, weekly, month, six_months, year_count)
    
    
  end
end
