desc "Add_Admins"
task :add_admins => :environment do
    user = User.new
    user.email = "catherine@hollywoodgravehunter.com"
    user.password = "Sydney1202"
    user.save

    user = User.new
    user.email = "jmo@olen-inc.com"
    user.password = "Brooke!202"
    user.save
end
