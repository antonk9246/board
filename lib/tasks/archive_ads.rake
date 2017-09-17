namespace :to_archive do
  desc 'All ads gives status archived'
  task :old_records => :environment do
    AdsItem.approved_scope.where('approval_date < ?', 3.days.ago.midnight).each do |model|
        model.aasm_state = :archived
        model.save
    end
  end
end