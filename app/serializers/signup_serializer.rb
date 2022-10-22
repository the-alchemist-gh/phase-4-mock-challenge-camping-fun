class SignupSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :activity
  belongs_to :camper
end
