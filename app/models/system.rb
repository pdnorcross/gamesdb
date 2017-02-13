class System < ActiveRecord::Base
  require 'csv'
  belongs_to :games
  
  def self.add_url
    system.update(url: "/games/console?con=#{s.name}")
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |system|
        csv << system.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      system = find_by_id(row['gid']) || new
      system.attributes = row.to_hash
      system.save!
    end
  end
end
