desc "Add_Category"
task :add_category => :environment do
    category = Category.new
    category.name = "Toy Story"
    category.save
end
