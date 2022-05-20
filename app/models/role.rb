class Role < ActiveRecord::Base
has_many :auditions

def actors
    self.auditions.map do |t|
        t.actor
    end
end

def locations
    self.auditions.map do |t|
        t.location
    end
end

def lead
    res =  self.auditions.find_by hired: true 
    if !res
        puts 'no actor has been hired for this role'
    else
    res
    end
end

def understudy
    array = self.auditions.where("hired= ?",false)
    array[1] ?  array[1] : 'no actor has been hired for understudy for this role'
        
end 
# 

end