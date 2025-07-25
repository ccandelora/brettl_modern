class Api::MembersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    members = User.order(:name).map do |user|
      {
        id: user.id,
        display_name: user.display_name,
        name: user.name,
        email: user.email,
        sex: user.sex,
        membership_type: user.membership_type
      }
    end

    render json: members
  end
end
