class Url < ActiveRecord::Base

	before_create :short
	# before_save :validates

	validates :long_url, presence: true, uniqueness: true, format: {with:/(http|https)/}

	# This is Sinatra! Remember to create a migration!

	def short
		short_url = SecureRandom.hex(4)
		self.short_url = "#{short_url}"
	end

end



