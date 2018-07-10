require_relative '../../page_objects/landing_page'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Landing Page" do

  before(:all) do
    platform = caps[:platformName].to_sym
    driver = start_driver
    @landing_page = LandingPage.new driver, platform
  end

  it 'should successfully load landing page', ios: true, android: true do |t|

    t.step 'Check that landing page loaded' do
      expect(@landing_page.is_on_landing_page).to equal true
    end
  end

  # Below are the following discrepencies found in the promo texts
  # android 'Publish from the park. Blog from the bus. Comment from the café. WordPress goes where you go.'
  # ios 'Publish from the park. Blog from the bus. Comment from the café. WordPress goes where you do.'
  #
  # android 'Watch readers from around the world read and interact with your site — in realtime.'
  # ios 'Watch readers from around the world read and interact with your site — in real time.'
  #
  #
  # android 'Manage your Jetpack-powered site on the go — you\'ve got WordPress in your pocket.'
  # ios 'Manage your Jetpack-powered site on the go — you‘ve got WordPress in your pocket.'
  it 'should successfully load all promotion cards', ios: true, android:true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.is_on_landing_page).to equal true
    end

    # Promotion texts for cards
    promo_texts = [
        'Publish from the park. Blog from the bus. Comment from the café. WordPress goes where you do.',
        'Watch readers from around the world read and interact with your site — in real time.',
        'Catch up with your favorite sites and join the conversation anywhere, any time.',
        'Your notifications travel with you — see comments and likes as they happen.',
        'Manage your Jetpack-powered site on the go — you‘ve got WordPress in your pocket.'
    ]

    promo_texts.each_with_index do |promo_text, i|
      t.step "Check card ##{i}" do
        expect(@landing_page.promo_label_text).to eq promo_text
      end

      t.step "Swipe card ##{i}" do
        expect(@landing_page.swipe_promo_label).to equal true
      end
    end

    i = promo_texts.length - 1
    promo_texts.reverse_each do |promo_text|
      t.step "Check card ##{i}" do
        expect(@landing_page.promo_label_text).to eq promo_text
      end

      t.step "Swipe card ##{i}" do
        expect(@landing_page.swipe_promo_label :right).to equal true
      end
      i -= 1
    end

  end
end