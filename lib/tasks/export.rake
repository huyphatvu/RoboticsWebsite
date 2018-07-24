namespace :export do
  desc "Prints Participant.all in a seeds.rb way."
  task :seeds_format => :environment do
    Participant.order('state, fullname').all.each do |participant|
      puts "Participant.create(#{participant.serializable_hash.to_s.gsub(/[{}]/,'')})"
    end
  end
end