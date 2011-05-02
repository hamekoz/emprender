# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

#Reglas de inflexion para programacion en español
ActiveSupport::Inflector.inflections do |inflect|
   inflect.plural /([aeiou])([A-Z]|_|$)/, '\1s\2'
   inflect.plural /([bcdfghjklmnpqrstvwy])([A-Z]|_|$)/, '\1es\2'
   inflect.plural /(z)([A-Z]|_|$)/, 'ces\2'

   inflect.singular /([aeiou])s([A-Z]|_|$)/, '\1\2'
   inflect.singular /([aeiou])([bcdfghjklmnpqrstvwy])es([A-Z]|_|$)/, '\1\2\3'
   inflect.singular /([bcdfghjklmnpqrstvwy])([bcdfghjklmnpqrstvwy])es([A-Z]|_|$)/, '\1\2e\3'
   inflect.singular /(ces)([A-Z]|_|$)/, 'z\2'

   inflect.irregular 'password', 'passwords'
   inflect.irregular 'session', 'sessions'
end
