class SettingsController < ApplicationController
    def index
        # @games = Game.all
        # @systems = System.all
    end
    
    def clear_sys
        System.delete_all
        redirect_to :back
    end
    
    def clear_game
        Game.delete_all
        redirect_to :back
    end
    
    def urls
        systems = System.all
    systems.each do |s|
      s.update(url: "/games/console?con=#{s.name}")
    end
        redirect_to :back
    end
    
    
    def owned_or_not_sett
        games = Game.all
        games.each do |game|
            systems = System.find_by(c_id: game.console_id)
            unless systems.nil?
                systems.update(owned: true)
            end
        end
        redirect_to :back
    end
    
end
