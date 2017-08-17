namespace :to_archive do
  desc 'All ads gives status archived'
  task :old_records => :environment do
    AdsItem.where(:aasm_state => :approved).where('approval_date < ?', 3.days.ago).each do |model|
        model.aasm_state = :archived
        model.save
    end
  end
end