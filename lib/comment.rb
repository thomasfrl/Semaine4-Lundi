class Comment
	attr_reader  :id_gossip, :content

	def initialize(id_gossip, content)
		@id_gossip = id_gossip
		@content = content
	end

	
	def save
		CSV.open("db/comment.csv","ab") do |csv|
			csv << [@id_gossip, @content]
		end
	end

	def self.all(id_gossip)
		all_comments = []
		CSV.foreach("db/comment.csv") do |row|
			if row[0] == id_gossip
				all_comments << row[1]
			end
		end
		return all_comments
	end
end
