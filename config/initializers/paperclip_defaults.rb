Paperclip.interpolates('clase') do |attachment, style|
  attachment.instance.class.to_s.underscore
end

Paperclip.interpolates('adjunto') do |attachment, style|
  attachment.name.to_s.downcase
end

Paperclip::Attachment.default_options.update({
  :url => ":clase_:id_:adjunto_:style.:extension"
})
