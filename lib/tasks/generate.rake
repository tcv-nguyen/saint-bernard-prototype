namespace :generate do
  # Each facility will generate 10 patients
  task demo_data: :environment do
    # Can only generate demo data on development mode
    next unless Rails.env.development?
    loop do
      @facility = FactoryBot.build(:facility)
      break if @facility.save
    end
    10.times do |n|
      FactoryBot.create(:patient, :with_full_info, facility: @facility)
    end
  end
end
