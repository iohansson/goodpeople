require 'spec_helper'

describe "index page" do
  include PagenavMacros
  include ExpectMacros
  
  let(:actors) { FactoryGirl.create_list(:actor_with_photo_video_comments, 16) }
  let(:actor) { FactoryGirl.create(:actor_with_photo_video_comments, name: "Майк Тайсон") }
  let(:unpublished_actor) { FactoryGirl.create(:actor_with_photo_video_comments, name: "Oliver Twist", is_published: false) }
  
  before do
    visit root_path
  end
  context "actors" do
    it "shows published actors" do
      actors
      unpublished_actor
      visit current_path
      actors.each do |actor|
        within actors_container do
          expect_to_have_actor_info(actor)
        end
      end
      expect(page).not_to have_content(unpublished_actor.name)
    end
  end
  context "calling back" do
    it "adds callback query", js: true do
      all('a', text: "Заказать звонок").first.click
      within ".callback-form" do
        fill_in "Телефон", with: "9628767884"
        fill_in "Имя", with: "Андрей Денисович"
        fill_in "Комментарий", with: "Хочу праздник! А че?"
        click_button "Отправить"
      end
      expect(page).to have_content("Спасибо за обращение! Наш менеджер свяжется с вами в течение 15 минут")
    end
  end
  context "ordering" do
    it "adds orders", js: true, focus: true do
      actor
      visit current_path
      all('a', text: "Оставьте заявку").first.click
      within ".order-form" do
        fill_in "Телефон", with: "9628767884"
        fill_in "Имя", with: "Андрей Денисович"
        fill_in "Комментарий", with: "Хочу праздник! А че?"
        fill_in "Дата мероприятия", with: "12/31/2014"
        select "Майк Тайсон", from: "Ведущий"
        click_button "Отправить"
      end
      expect(page).to have_content("Спасибо за заказ! Наш менеджер свяжется с вами в ближайшее время")
    end
  end
end
