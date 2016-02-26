class Enums
  def self.any?(collection, condition)
    condition_flag = false

    collection.each do |n|
      condition_flag = true if condition.call(n) == true
    end

    condition_flag
  end

  def self.select(collection, condition)
    selected_items = []

    collection.each do |n|
      selected_items << n if condition.call(n) == true
    end

    selected_items
  end

  def self.reject(collection, condition)
    selected_items = []

    collection.each do |n|
      selected_items << n if condition.call(n) == false
    end

    selected_items
  end
end
