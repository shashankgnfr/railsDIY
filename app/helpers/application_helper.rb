module ApplicationHelper

	def human_boolean(boolean)
    boolean ? 'Approved' : 'Pending'
	end
end
