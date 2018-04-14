class PeakFlowUtils::TranslationValue < BazaModels::Model
  belongs_to :translation_key, foreign_key: "translation_key_id", class_name: "PeakFlowUtils::TranslationKey"

  validates_presence_of :translation_key

  delegate :key, to: :translation_key

  def calculated_translation_file_path
    "#{handler_translation.dir}/#{locale}.yml" if handler_translation
  end

  def handler_translation
    @handler_translation ||= PeakFlowUtils::HandlerTranslation
      .find_by(translation_key_id: translation_key_id)
  end

  def migrate_to_awesome_translations_namespace!
    PeakFlowUtils::TranslationMigrator.new(
      translation_key: translation_key,
      handler_translation: handler_translation,
      translation_value: self
    ).execute
  end
end
