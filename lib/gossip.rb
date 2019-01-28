
class Gossip
	attr_reader :author, :content

	def initialize(author, content)
		@content = content
		@author = author
	end

	def modify(author, content)
		gossips = []
		CSV.open("db/gossip.csv","a+") do |csv|
			gossips = csv.read
			gossips.each_with_index do |gossip,i|
				if gossip == [self.author,self.content]
					gossips[i] = [author,content]
					break 
				end
			end
		end
		puts gossips
		CSV.open("db/gossip.csv","w+") do |csv|
			gossips.each do |gossip|
				csv << [gossip[0], gossip[1]]
			end
		end

	end

	def self.find(id)
		return Gossip.all[id]
	end

	def save
		CSV.open("db/gossip.csv","ab") do |csv|
			csv << [@author, @content]
		end
	end

	def self.all
		all_gosips = []
		CSV.foreach("db/gossip.csv") do |row|
			gossip_provisoire = Gossip.new(row[0],row[1])
			all_gosips << gossip_provisoire
		end
		return all_gosips
	end

	def remove
		gossips = []
		CSV.open("db/gossip.csv","a+") do |csv|
			gossips = csv.read
			gossips.each do |gossip|
				if gossip == [self.author,self.content]
					gossips.delete(gossip)
					break
				end	
			end
		end
		CSV.open("db/gossip.csv","w+") do |csv|
			gossips.each do |gossip|
				csv << [gossip[0], gossip[1]]
			end
		end
	end
end