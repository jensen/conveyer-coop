module RequestSessionHelpers
  def login(email)
    post sessions_path, params: { session: attributes_for(:user, email: email) }
  end

  def set_session(vars = {})
    post test_sessions_path, params: { session_vars: vars }
    expect(response).to have_http_status(:created)

    vars.each_key do |var|
      expect(session[var]).to be_present
    end
  end
end
