module GamesHelper
    # def owned_or_not_a
    #     games = Game.all
    #     games.each do |game|
    #         systems = System.find_by(c_id: game.console_id).where.not(owned: true)
    #         unless systems.empty?
    #             sytems.update(owned: true)
    #         end
    #     end
    # end
    
    def check_sys(game)
        unless game.console_id != nil
            systems = System.find_by(name: game.c_name)
            unless systems.nil? 
            game.update(console_id: systems.c_id)
            end
        end
    end
    
    def owned_or_not_b(game)
        systems = System.find_by(c_id: game.console_id)
        unless systems.nil?
        systems.update(owned: true)
        end
    end
    
end