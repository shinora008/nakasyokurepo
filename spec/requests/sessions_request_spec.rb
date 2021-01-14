require 'rails_helper'

RSpec.describe "ログイン", type: :request do

  it "正常なレスポンスを返すこと" do
    get login_path
    expect(response).to be_successful
    expect(response).to have_http_status "200"
  end
end