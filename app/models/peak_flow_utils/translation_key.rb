class PeakFlowUtils::TranslationKey < PeakFlowUtils::ApplicationRecord
  establish_connection "peak_flow_utils"

  belongs_to :group, foreign_key: "group_id"
  belongs_to :handler, foreign_key: "handler_id"

  has_many :handler_translations,
    dependent: :destroy,
    foreign_key: "translation_key_id",
    class_name: "PeakFlowUtils::HandlerTranslation"

  has_many :translation_values,
    dependent: :destroy,
    foreign_key: "translation_key_id",
    class_name: "PeakFlowUtils::TranslationValue"

  validates_presence_of :group, :handler

  def last_key
    key.to_s.split(".").last
  end
end
