class PeakFlowUtils::HandlerText < PeakFlowUtils::ApplicationRecord
  belongs_to :group
  belongs_to :handler
  belongs_to :translation_key

  validates :handler, :translation_key, presence: true

  delegate :key, :last_key, to: :translation_key
  delegate :value, to: :translation, prefix: true
  delegate :array_translation?, :file_line_content, :file_line_content?, :translated_value_for_locale, to: :translation

  def key_show_with_fallback
    key_show.presence || last_key
  end

  def translation
    @translation ||= PeakFlowUtils::Translation.new(
      key: key,
      dir: dir,
      full_path: full_path,
      file_path: file_path,
      line_no: line_no
    )
  end

  def finished?
    @_finished = translation.finished? if @finished.nil?
    @_finished
  end

  def unfinished?
    !finished?
  end

  def array_key
    return unless (match = key.match(/\A(.+)\[(\d+)\]\Z/))

    match[1]
  end

  def array_no
    return unless (match = key.match(/\A(.+)\[(\d+)\]\Z/))

    match[2].to_i
  end
end
