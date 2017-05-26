namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).update_all(completed: true)
  end

end
