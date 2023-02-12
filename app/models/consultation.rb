class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  belongs_to :consultation_group, optional: true
  accepts_nested_attributes_for :consultation_group

  has_many :notes, foreign_key: :creation_consultation_id, dependent: :destroy
  has_many :treatments, dependent: :destroy

  validates :start_date, presence: true



  def transform_treatments_in_html
    substitution = {
      "é" => "e",
      "è" => "e",
      " " => "-"
    }
    self.treatments.map do |treatment|
      "<div class='treatements treatement-category-#{treatment.category.downcase.gsub(/[éè ]/, substitution)}'><p style='margin-bottom: 0px;'><span>#{treatment.category.gsub(" ", substitution)}</span></p></div>"
    end
  end

  def display_treatments
    html_treatments = transform_treatments_in_html
    if transform_treatments_in_html.size > 2
      html_treatments.first(2).push("<div class='treatements treatement-category-autre'><p style='margin-bottom: 0px;'><span>...</span></p></div>").join
    else
      transform_treatments_in_html.join
    end
  end


  def done?
    treatments.all? do |treatment|
      treatment.done == true
    end
  end
end
