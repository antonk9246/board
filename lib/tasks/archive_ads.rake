namespace :archived do
  desc 'All ads gives status archived'
  task :old_records => :environment do 
    AdsItem.where('approval_date < ?', 3.days.ago).each do |model|
      model.archive
    end
  end
end