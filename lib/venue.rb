class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates(:name, :presence => true)


  before_save(:titlecase_name)

  private

  def titlecase_name
    self.name=(name().titlecase())
  end
end
