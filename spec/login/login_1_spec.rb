require_relative '../../page_objects/landing_page'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Landing Page" do

  before(:each) do
    platform = caps[:platformName].to_sym
    driver = start_driver
    @landing_page = LandingPage.new driver, platform
  end

  it 'should successfully load landing page', ios: true, android: true do |t|

    t.step 'Check that landing page loaded' do
      expect(@landing_page.is_on_landing_page).to equal true
    end
  end

  it 'should successfully load all promotion cards', ios: true, android:true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.is_on_landing_page).to equal true
    end

    # Promotion texts for cards
    promo_texts = [
        'Publish from the park. Blog from the bus. Comment from the café. WordPress goes where you go.',
        'Watch readers from around the world read and interact with your site — in realtime.',
        'Catch up with your favorite sites and join the conversation anywhere, any time.',
        'Your notifications travel with you — see comments and likes as they happen.',
        'Manage your Jetpack-powered site on the go — you\'ve got WordPress in your pocket.'
    ]

    promo_texts.each do |i, promo_text|
      t.step "Check card ##{i}" do
        expect(@landing_page.promo_label_exists(promo_text)).to equal true

      end
    end

  end
end