class Enum
  def self.any?(collection, condition)
    condition_flag = false

    collection.each do |n|
      condition_flag = true if condition.call(n) == true
    end

    condition_flag
  end
end
