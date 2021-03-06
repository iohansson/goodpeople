module AttachMacros
  def test_files_dir
    Rails.root.join('spec','files')
  end
  
  def upload_photo_to_actor(actor)
    within ".photos" do
      attach_file "Добавить фото", test_files_dir + "test.jpg"
      click_button "Добавить"
    end
  end
  
  def upload_video_to_actor(actor)
    click_link actor.name
    within ".videos" do
      fill_in "Добавить видео", with: "video_id"
      click_button "Добавить"
    end
  end
end
