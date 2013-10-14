class Short < ActiveRecord::Base
  attr_accessible :long, :desc
  attr_accessor :desc

validates :long,
			:presence => true,
			:format => {
			:with => %r{\A\http://},
			:message => "Only HTTP links allowed!"
			}

def to_param
   if self.desc.nil?
     b36_id
   else
     "#{b36_id}/#{self.desc}"
   end
 end

def b36_id
   self.id.to_i.to_s(36)
  end
end