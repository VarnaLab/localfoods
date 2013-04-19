class ApplicationState < ActiveRecord::Base

	attr_accessible :orders_open, :email_content, :email_users, :clear_carts
	attr_accessor :email_content, :email_users, :clear_carts

	#return boolean
	def self.orders_open?
		create_row_if_absent
		ApplicationState.first.orders_open
	end

	def self.get_state
		create_row_if_absent
		ApplicationState.first
	end

	#returns yes/no
	def self.orders_open
		if self.orders_open
			"Yes"
		else
			"No"
		end
	end

	private
	def self.create_row_if_absent
		if(ApplicationState.first.nil?)
			state = ApplicationState.new
			state.save
		end
	end
end
