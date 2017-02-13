class HomeController < ApplicationController
  def index
    @games = Game.all
    @systems = System.where('played = 1 and owned = true').order(:id)
  end

  private

  def reports
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

    @total = games.length
    @month = thirty_day.length
    @six_months = six_month.length
    @year_count = year.length
    @daily = one_day.length
    @weekly = s_day.length
  end
end
