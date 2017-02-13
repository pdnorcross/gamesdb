class Game < ActiveRecord::Base
  require 'csv'
  has_many :systems

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |game|
        csv << game.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      game = find_by_id(row['gid']) || new
      game.attributes = row.to_hash
      game.save!
    end
  end
end
