module ExpectMacros
  def expect_to_have_actor_info(actor)
    expect(page).to have_content(actor.name)
  end
end
