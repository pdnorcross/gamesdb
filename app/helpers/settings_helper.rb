module SettingsHelper
    def look_for_games(systems)
        games = Game.find_by(console_id: systems.c_id)
        unless games.nil?
            systems.update(owned: true)
            check_sys(games)
        end
    end
    
    def check_sys(game)
        if game.console_id == nil
            systems = System.find_by(name: game.c_name)
            game.update(console_id: systems.c_id)
        end
    end
    
    
    def add_url(s)
            s.update(url: "/games/console?con=#{s.name}")
    end
end
